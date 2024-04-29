//
//  GradientButton.swift
//  PoliceLights
//
//  Created by sergey on 24.02.2024.
//

import UIKit

class GradientButton: UIButton {
    
    private let gradientLayer = CAGradientLayer.gradientLayer(in: .zero)
    
    var customRect: CGRect?
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        if let customRect {
//            gradientLayer.frame = customRect
//        } else {
//            gradientLayer.frame = bounds
//        }
//    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        if let customRect {
            gradientLayer.frame = customRect
        } else {
            gradientLayer.frame = bounds
        }
    }
    
    func setGradientRect(rect: CGRect) {
        customRect = rect
        gradientLayer.frame = rect
    }
    
    func setSelected() {
        tintColor = .Colors.gradientBegin
        gradientLayer.isHidden = false
    }
    
    func setGradient(on: Bool) {
        if on { gradientLayer.isHidden = false }
        else { gradientLayer.isHidden = true }
    }
    
    func setNormal() {
        tintColor = .Colors.white
        gradientLayer.isHidden = true
    }
    
    private func setupUI() {
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
