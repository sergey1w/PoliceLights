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
        let beginColor = UIColor(red: 0.604, green: 0.227, blue: 0.98, alpha: 1).cgColor
        let endColor = UIColor(red: 0.671, green: 0.035, blue: 0.776, alpha: 1).cgColor
        
        return [beginColor, endColor]
    }
}
