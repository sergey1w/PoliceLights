//
//  FramePickerViewController.swift
//  PoliceLights
//
//  Created by sergey on 22.04.2024.
//

import UIKit

final class FramePickerViewController: UIViewController {
    
    private let framePickerView = FramePickerView(frame: .zero)
    private let preview = SirensPreview()
    private let saveButton = RoundedButton()
    
    private(set) var frames: [SirenFrame] = []
    private(set) var currentIndex: Int = 0 {
        didSet {
            framePickerView.setLabels(f: currentIndex.description)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setFrame(frame: SirenFrame) {
        guard currentIndex < frames.count else { return }
        frames[currentIndex] = frame
        preview.setFrame(frame: frames[currentIndex])
    }
    
    @objc func firstFrame() {
        guard let frame = frames.first else { return }
        preview.setFrame(frame: frame)
        currentIndex = 0
    }
    @objc func prevFrame() {
        guard currentIndex - 1 >= frames.startIndex else { return }
        preview.setFrame(frame: frames[currentIndex - 1])
        currentIndex = currentIndex - 1
    }
    @objc func lastFrame() {
        guard let frame = frames.last else { return }
        preview.setFrame(frame: frame)
        currentIndex = frames.count - 1
    }
    @objc func nextFrame() {
        guard currentIndex + 1 < frames.endIndex else { return }
        preview.setFrame(frame: frames[currentIndex + 1])
        currentIndex += 1
    }
    @objc func addFrame() {
        frames.append(.init())
        currentIndex = frames.count - 1
        preview.setFrame(frame: frames[currentIndex])
    }
    
    private func setup() {
        preview.isUserInteractionEnabled = false
        view.addSubview(framePickerView)
        view.addSubview(preview)
        view.addSubview(saveButton)
        setupSaveButton()
        framePickerView.snap(to: view.safeAreaLayoutGuide, [.trailing,.top])
        preview.snap(to: view.safeAreaLayoutGuide, [.leading,.bottom])
        saveButton.snap(to: view.safeAreaLayoutGuide, [.bottom,.trailing])
        saveButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        NSLayoutConstraint.snap([saveButton.leadingAnchor], [preview.trailingAnchor], constants: [16])
    }
    
    private func setupSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.setSelected()
        saveButton.setImage(.Icons.tickSquare, for: .normal)
        saveButton.tintColor = .white
        saveButton.bringSubviewToFront(saveButton.imageView ?? saveButton) // ios bug
        saveButton.setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
    }
}
