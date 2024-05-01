//
//  FramePickerViewController.swift
//  PoliceLights
//
//  Created by sergey on 22.04.2024.
//

import UIKit

final class FramePickerViewController: UIViewController {
    
    private let framePickerView = FramePickerView(frame: .zero)
    private let preview = SirensPreview(topView: PreviewLabel())
    private let deleteFrameButton = RoundedButton.deleteButton()
    private let saveButton = RoundedButton.saveButton()
    
    private(set) var frames: [SirenFrameModel] = []
    private(set) var currentIndex: Int = 0 {
        didSet {
            framePickerView.setLabels(f: currentIndex.description)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setFrame(frame: SirenFrameModel) {
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
        guard !frames.isEmpty else { return }
        currentIndex = max(0, currentIndex - 1)
        preview.setFrame(frame: frames[currentIndex])
    }
    @objc func lastFrame() {
        guard let frame = frames.last else { return }
        preview.setFrame(frame: frame)
        currentIndex = frames.count - 1
    }
    @objc func nextFrame() {
        guard !frames.isEmpty else { return }
        currentIndex = min(frames.count - 1, currentIndex + 1)
        preview.setFrame(frame: frames[currentIndex])
    }
    @objc func addFrame() {
        frames.append(.init())
        currentIndex = frames.count - 1
        preview.setFrame(frame: frames[currentIndex])
    }
    @objc func deleteFrame() {
        guard currentIndex < frames.count else { return }
        frames.remove(at: currentIndex)
        currentIndex = max(0, currentIndex - 1)
        if frames.isEmpty {
            preview.setFrame(frame: .init())
            framePickerView.setLabels(f: "")
        } else {
            preview.setFrame(frame: frames[currentIndex])
        }
    }
    
    private func setup() {
        view.addSubview(framePickerView)
        view.addSubview(preview)
        view.addSubview(saveButton)
        view.addSubview(deleteFrameButton)
        preview.isUserInteractionEnabled = false
        setupButtons()
        setupUI()
    }
    
    private func setupButtons() {
        deleteFrameButton.addTarget(self, action: #selector(deleteFrame), for: .touchUpInside)
        saveButton.addTarget(parent, action: #selector(CreateSirenViewController.saveSiren), for: .touchUpInside)
    }
    
    private func setupUI() {
        framePickerView.snap(to: view.safeAreaLayoutGuide, [.trailing,.top])
        preview.snap(to: view.safeAreaLayoutGuide, [.leading,.bottom])
        saveButton.snap(to: view.safeAreaLayoutGuide, [.bottom,.trailing])
        saveButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        NSLayoutConstraint.snap([saveButton.leadingAnchor], [preview.trailingAnchor], constants: [16])
        deleteFrameButton.snap(to: view.safeAreaLayoutGuide, [.trailing])
        deleteFrameButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
        NSLayoutConstraint.snap(
            [deleteFrameButton.leadingAnchor], [preview.trailingAnchor],
            constants: [16]
        )
        NSLayoutConstraint.snap(
            [deleteFrameButton.bottomAnchor],
            [saveButton.topAnchor],
            constants: [-8]
        )
    }
}
