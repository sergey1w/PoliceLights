//
//  UIView+cornerRadius.swift
//
//  Created by sergey on 01.08.2023.
//

import UIKit

extension UIView {
    func roundCorners() {
        layer.cornerRadius = bounds.height/2
        clipsToBounds = true
    }
    
    func roundCorners(_ radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}
