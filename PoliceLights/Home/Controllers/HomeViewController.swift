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
        view.addSubview(gradientButton)
        
        gradientButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            gradientButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gradientButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientButton.widthAnchor.constraint(equalToConstant: 48),
            gradientButton.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        gradientButton.setTitle("OFF", for: .normal)
    }
}
