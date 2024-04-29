//
//  TabBarViewController.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import UIKit

final class TabBarViewController: UIViewController {
    
    private let tabControl = TabSegmentedControl()
    
    private let createController = CreateSirenViewController()
    private let readyController = ReadySirenViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tabControl.delegate = self
        add(createController)
        add(readyController)
        setupUI()
    }
}

extension TabBarViewController: TabSegmentedControlDelegate {
    func setCreateTab() {
        readyController.view.isHidden = true
        createController.view.isHidden = false
    }
    
    func setReadyTab() {
        readyController.view.isHidden = false
        createController.view.isHidden = true
    }
}

private extension TabBarViewController {
    func setupUI() {
        self.view.addSubview(tabControl)
        makeConstraints()
        tabControl.setReadyTab()
    }
    
    func makeConstraints() {
        tabControl.snap(to: self.view.safeAreaLayoutGuide, [.top], constant: 16)
        tabControl.snap(to: self.view.safeAreaLayoutGuide, [.centerX])
        NSLayoutConstraint.activate([
            tabControl.widthAnchor.constraint(equalToConstant: 342),
            tabControl.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        createController.view.snap(to: self.view.safeAreaLayoutGuide, [.leading,.bottom,.trailing])
        NSLayoutConstraint.snap([tabControl.bottomAnchor], [createController.view.topAnchor], constants: [-8])
        
        readyController.view.snap(to: self.view.safeAreaLayoutGuide, [.leading,.bottom,.trailing])
        NSLayoutConstraint.snap([tabControl.bottomAnchor], [readyController.view.topAnchor],constants: [-8])
    }
}
