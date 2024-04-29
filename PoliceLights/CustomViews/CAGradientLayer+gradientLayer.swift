//
//  CAGradientLayer+gradientLayer.swift
//  PoliceLights
//
//  Created by sergey on 24.02.2024.
//

import UIKit

extension CAGradientLayer {
    static func gradientLayer(in frame: CGRect) -> Self {
        let layer = Self()
        layer.colors = colors()
        
        // from left to right
        layer.startPoint = .init(x: 0, y: 0.5)
        layer.endPoint = .init(x: 1, y: 0.5)
        
        layer.frame = frame
        return layer
    }
    
    private static func colors() -> [CGColor] {
        let beginColor = UIColor.Colors.gradientBegin.cgColor
        let endColor = UIColor.Colors.gradientEnd.cgColor
        
        return [beginColor, endColor]
    }
}
