//
//  TabSegmentedControl.swift
//  PoliceLights
//
//  Created by sergey on 09.03.2024.
//

import UIKit

protocol TabSegmentedControlDelegate: AnyObject {
    func setCreateTab() -> Void
    func setReadyTab() -> Void
}

final class TabSegmentedControl: UIView {
    
    private let createButton = RoundedButton()
    private let readyButton = RoundedButton()
    
    weak var delegate: TabSegmentedControlDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @objc func setCreateTab() {
        readyButton.setNormal()
        createButton.setSelected()
        readyButton.layer.zPosition = 0
        createButton.layer.zPosition = 1
        delegate?.setCreateTab()
    }
    
    @objc func setReadyTab() {
        createButton.setNormal()
        readyButton.setSelected()
        createButton.layer.zPosition = 0
        readyButton.layer.zPosition = 1
        delegate?.setReadyTab()
    }
    
    private func setupUI() {
        addSubview(createButton)
        addSubview(readyButton)
        setupCreateButton()
        setupReadyButton()
        makeConstraints()
    }
    
    private func makeConstraints() {
        createButton.translatesAutoresizingMaskIntoConstraints = false
        createButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.snap(
            [createButton.widthAnchor, createButton.heightAnchor],
            [readyButton.widthAnchor,readyButton.heightAnchor]
        )
        createButton.snap(to: self, [.leading,.top,.bottom])
        readyButton.snap(to: self, [.trailing,.top,.bottom])
        NSLayoutConstraint.snap(
            [createButton.trailingAnchor],
            [readyButton.leadingAnchor],
            constants: [26]
        )
    }
    
    private func setupCreateButton() {
        createButton.setTitle("Create", for: .normal)
        createButton.addTarget(self, action: #selector(setCreateTab), for: .touchUpInside)
    }
    
    private func setupReadyButton() {
        readyButton.setTitle("Ready", for: .normal)
        readyButton.addTarget(self, action: #selector(setReadyTab), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
