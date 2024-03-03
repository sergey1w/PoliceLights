//
//  BackgroundLayer.swift
//  PoliceLights
//
//  Created by sergey on 24.02.2024.
//

import UIKit

final class BackgroundLayer: CALayer {
    
    override init() {
        super.init()
        setup()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.Colors.darkBackground.cgColor
        let image = UIImage.background
        contents = image.cgImage
        contentsGravity = .resizeAspectFill
        transform = CATransform3DMakeRotation(0 / 180.0 * .pi, 0.0, 0.0, 1.0)
    }
    
    func setOrientation() {
        if UIDevice.current.orientation.isLandscape {
            transform = CATransform3DMakeRotation(0 / 180.0 * .pi, 0.0, 0.0, 1.0)
        } else {
            transform = CATransform3DMakeRotation(90 / 180.0 * .pi, 0.0, 0.0, 1.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
