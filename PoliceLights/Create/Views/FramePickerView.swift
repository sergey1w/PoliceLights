//
//  FramePickerView.swift
//  PoliceLights
//
//  Created by sergey on 23.04.2024.
//

import UIKit

final class FramePickerView: UIView {
    // MARK: Controls
    // top stack
    private let topStackView = UIStackView()
    private let firstFrameButton = RoundedButton()
    private let previousFrameButton = RoundedButton()
    private let lastFrameButton = RoundedButton()
    private let nextFrameButton = RoundedButton()
    private let firstFrameLabel = UILabel()
    // bottom stack
    private let bottomStackView = UIStackView()
    private let playButton = RoundedButton()
    private let addFrameButton = RoundedButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setLabels(f: String) {
        firstFrameLabel.text = f
    }
    
    private func setup() {
        setupUI()
        setupButtons()
        setupLabels()
    }
    
    private func setupButtons() {
        firstFrameButton.setImage(.Icons.chevronRight1, for: .normal)
        previousFrameButton.setImage(.Icons.chevronRight, for: .normal)
        lastFrameButton.setImage(.Icons.chevronLeft1, for: .normal)
        nextFrameButton.setImage(.Icons.chevronLeft, for: .normal)
        
        firstFrameButton.addTarget(nil, action: #selector(FramePickerViewController.firstFrame), for: .touchUpInside)
        previousFrameButton.addTarget(nil, action: #selector(FramePickerViewController.prevFrame), for: .touchUpInside)
        lastFrameButton.addTarget(nil, action: #selector(FramePickerViewController.lastFrame), for: .touchUpInside)
        nextFrameButton.addTarget(nil, action: #selector(FramePickerViewController.nextFrame), for: .touchUpInside)
        
        playButton.setImage(.Icons.play1, for: .normal)
        addFrameButton.setImage(.Icons.plus, for: .normal)
        
        playButton.addTarget(nil, action: #selector(CreateSirenViewController.playPreview), for: .touchUpInside)
        addFrameButton.addTarget(nil, action: #selector(FramePickerViewController.addFrame), for: .touchUpInside)
    }
    
    private func setupLabels() {
        firstFrameLabel.textColor = .Colors.white
        firstFrameLabel.widthAnchor.constraint(equalToConstant: 70).isActive = true
        firstFrameLabel.textAlignment = .center
        firstFrameLabel.layer.borderColor = Constants.borderColor
        firstFrameLabel.layer.borderWidth = 1
        firstFrameLabel.layer.cornerRadius = Constants.cornerRadius
        firstFrameLabel.layer.backgroundColor = Constants.backgroundColor
        firstFrameLabel.layer.masksToBounds = true
        firstFrameLabel.layer.borderColor = Constants.borderColor
    }
    
    private func setupUI() {
        addSubview(topStackView)
        addSubview(bottomStackView)
        topStackView.addArrangedSubviews([
            firstFrameButton, previousFrameButton,
            firstFrameLabel, /*secondFrameLabel,*/
            nextFrameButton, lastFrameButton
        ])
        [firstFrameButton,
         previousFrameButton,
         nextFrameButton,
         lastFrameButton,
         playButton,
         addFrameButton
        ].forEach({ btn in
            btn.contentEdgeInsets = .tuple((12,12,12,12))
            btn.widthAnchor.constraint(equalToConstant: 48).isActive = true
        })
        bottomStackView.addArrangedSubviews([playButton, addFrameButton])
        bottomStackView.spacing = 4
        topStackView.snap(to: self, [.leading,.trailing,.top])
        topStackView.spacing = 4
        topStackView.setCustomSpacing(8, after: previousFrameButton)
        topStackView.setCustomSpacing(8, after: firstFrameLabel)
        bottomStackView.snap(to: self, [.bottom, .centerX])
        NSLayoutConstraint.snap([bottomStackView.topAnchor],
                                [topStackView.bottomAnchor],
                                constants: [8])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension FramePickerView {
    enum Constants {
        static let cornerRadius: CGFloat = 14
        static let fontSize: CGFloat = 19
        static let lineHeight: CGFloat = 24
        static let backgroundColor = UIColor.Colors.black.cgColor
        static let borderColor = UIColor.Colors.gray.cgColor
    }
}
