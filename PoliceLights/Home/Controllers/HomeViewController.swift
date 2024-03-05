//
//  HomeViewController.swift
//  PoliceLights
//
//  Created by sergey on 24.02.2024.
//

import UIKit

final class HomeViewController: UIViewController {
    
    let gradientButton = GradientButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    
    private func setupUI() {
        gradientButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(gradientButton)
        gradientButton.snap(to: self.view.safeAreaLayoutGuide, [.centerX,.centerY])
        NSLayoutConstraint.activate([
            gradientButton.widthAnchor.constraint(equalToConstant: 48),
            gradientButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        gradientButton.setTitle("go", for: .normal)
        
        gradientButton.addTarget(self, action: #selector(lego), for: .touchUpInside)
    }
    
    
    @objc private func lego() {
        let vc = SirenViewController(model: .init(frames: mockFrames, frequency: 3, sound: .police))
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true)
    }
}
