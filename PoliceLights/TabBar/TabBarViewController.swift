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
    private let createdSirensButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setup() {
        tabControl.delegate = self
        add(createController)
        add(readyController)
        setupUI()
    }
    
    @objc func openCreatedSirens() {
        let createdSirens = CreatedSirensService.shared.getSirens()
        let vc = CreatedSirensViewController(sirens: createdSirens)
        navigationController?.pushViewController(vc, animated: false)
    }
}

extension TabBarViewController: TabSegmentedControlDelegate {
    func setCreateTab() {
        readyController.view.isHidden = true
        createController.view.isHidden = false
        createdSirensButton.isHidden = false
    }
    
    func setReadyTab() {
        readyController.view.isHidden = false
        createController.view.isHidden = true
        createdSirensButton.isHidden = true
    }
}

private extension TabBarViewController {
    func setupUI() {
        self.view.addSubview(tabControl)
        self.view.addSubview(createdSirensButton)
        makeConstraints()
        tabControl.setReadyTab()
        setupCreatedSirensButton()
    }
    
    func setupCreatedSirensButton() {
        let str = NSAttributedString.attributedString("Created", font: .subtitle1, color: .white)
        createdSirensButton.setAttributedTitle(str, for: .normal)
        createdSirensButton.addTarget(self, action: #selector(openCreatedSirens), for: .touchUpInside)
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
        
        createdSirensButton.snap(to: self.view.safeAreaLayoutGuide, [.top], constant: 16)
        createdSirensButton.snap(to: self.view.safeAreaLayoutGuide, [.trailing])
    }
}
