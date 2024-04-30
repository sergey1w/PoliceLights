//
//  CreateSirenViewController.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import UIKit

final class CreateSirenViewController: UIViewController {

    private let sectionsStackView = UIStackView()
    
    private let sirensSectionButton: GradientButton = GradientButton()
    private let speedSectionButton: GradientButton = GradientButton()
    private let lightsSectionButton: GradientButton = GradientButton()
    private let storySectionButton: GradientButton = GradientButton()
    
    private let soundPlayer = SirenSoundPlayer()
    private let fpsGroup = RoundedButtonGroup<Int>(titleHidden: true, offButton: false)
    private let sirensPicker = SirensPickerViewController()
    private let framePicker = FramePickerViewController()
    
    private(set) var section: Section = .siren
    
    private var sound: SirenSound? {
        soundPlayer.sound
    }
    
    private var fps: Int {
        fpsGroup.selection ?? 1
    }
    
    private var frames: [SirenFrameModel] {
        framePicker.frames
    }
    
    private var currentFrameIndex: Int {
        framePicker.currentIndex
    }
    
    private var currentFrame: SirenFrameModel {
        get {
            guard currentFrameIndex < frames.count else { return .init() }
            return framePicker.frames[currentFrameIndex]
        }
        set { framePicker.setFrame(frame: newValue) }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        selectSection(sender: sirensSectionButton)
    }
    
    @objc private func selectSection(sender: GradientButton) {
        guard let section = Section(rawValue: sender.tag) else { return }
        sectionsStackView.arrangedSubviews.forEach { view in
            (view as? GradientButton)?.setNormal()
        }
        sender.setGradientRect(rect: sender.underlineRect)
        sender.setSelected()
        self.section = section
        manageViews()
    }
    
    @objc func playPreview() {
        guard !frames.isEmpty else { return }
        let model = SirenModel(frames: frames, frequency: fps, sound: sound)
        let vc = SirenViewController(model: model, sound: sound ?? nil)
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
    
    @objc func saveSiren() {
        let createdSiren = CreatedSiren(context: CoreDataManager.shared.mainContext)
        createdSiren.name = UUID().uuidString
        createdSiren.frequency = Int16(fps)
        createdSiren.sound = sound?.rawValue
        createdSiren.frames = NSSet(array: frames)
        CoreDataManager.shared.saveContext()
    }
    
    private func manageViews() {
        func hideAll() {
            soundPlayer.isHidden = true
            fpsGroup.isHidden = true
            sirensPicker.view.isHidden = true
            framePicker.view.isHidden = true
        }
        hideAll()
        switch section {
        case .siren:
            soundPlayer.isHidden = false
        case .fps:
            fpsGroup.isHidden = false
        case .policeLights:
            sirensPicker.setFrame(frame: currentFrame)
            sirensPicker.view.isHidden = false
        case .storyboard:
            framePicker.view.isHidden = false
        }
    }
    
    private func setup() {
        add(sirensPicker)
        add(framePicker)
        sirensPicker.framePicker = framePicker
        setupFpsGroup()
        setupUI()
    }
}

private extension CreateSirenViewController {
    func setupUI() {
        setupSectionStackView()
        
        view.addSubview(sectionsStackView)
        sectionsStackView.snap(to: view.safeAreaLayoutGuide, [.leading,.top,.bottom])
        
        view.addSubview(soundPlayer)
        soundPlayer.snap(to: self.view.safeAreaLayoutGuide, [.trailing,.top,])
        
        view.addSubview(fpsGroup)
        fpsGroup.snap(to: self.view.safeAreaLayoutGuide, [.trailing,.top])
        fpsGroup.isHidden = true
        
        sirensPicker.view.snap(to: self.view.safeAreaLayoutGuide, [.trailing,.top, .bottom])
        sirensPicker.view.isHidden = true
        
        framePicker.view.snap(to: self.view.safeAreaLayoutGuide, [.trailing,.top, .bottom])
        framePicker.view.isHidden = true
    }
    
    private func setupFpsGroup() {
        fpsGroup.configure(title: "", selections: [20,12,6,3,1])
    }
    
    private func setupSectionStackView() {
        sectionsStackView.axis = .vertical
        sectionsStackView.spacing = 16
        sectionsStackView.alignment = .leading
        sectionsStackView.distribution = .equalSpacing
        sectionsStackView.addArrangedSubviews([
            sirensSectionButton,
            speedSectionButton,
            lightsSectionButton,
            storySectionButton
        ])
        configureSectionButton(sirensSectionButton, for: .siren)
        configureSectionButton(speedSectionButton, for: .fps)
        configureSectionButton(lightsSectionButton, for: .policeLights)
        configureSectionButton(storySectionButton, for: .storyboard)
    }
    
    private func configureSectionButton(_ button: GradientButton, for section: Section) {
        let attrStr = NSAttributedString.attributedString(
            section.title.uppercased(),
            fontSize: 19,
            lineHeight: 24
        )
        button.setImage(section.icon, for: .normal)
        button.setAttributedTitle(attrStr, for: .normal)
        button.tintColor = .Colors.white
        button.setInsets(forContentPadding: .zero, imageTitlePadding: Constants.buttonIconSpacing)
        button.addTarget(self, action: #selector(selectSection(sender:)), for: .touchUpInside)
        button.tag = section.rawValue
        button.setNormal()
    }
}

extension CreateSirenViewController {
    enum Section: Int {
        case siren = 1
        case fps
        case policeLights
        case storyboard
        
        var title: String {
            switch self {
            case .siren: "Sirens"
            case .fps: "Speed (frames per second)"
            case .policeLights: "Police light"
            case .storyboard: "Storyboard"
            }
        }
        
        var icon: UIImage {
            switch self {
            case .siren: UIImage.Icons.volumeUp
            case .fps: UIImage.Icons.speed1
            case .policeLights: UIImage.Icons.filter
            case .storyboard: UIImage.Icons.play
            }
        }
    }
}

private extension CreateSirenViewController {
    enum Constants {
        static let buttonIconSpacing: CGFloat = 8
        static let gradientLineHeight: CGFloat = 3
        static let defaultIconWidth: CGFloat = 23
    }
}
