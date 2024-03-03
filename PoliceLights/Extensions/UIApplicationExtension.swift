//
//  UIApplicationExtension.swift
//  Food3-ios
//
//  Created by sergey on 04.10.2023.
//

import UIKit

extension UIApplication {
    
    static let sceneDelegate = shared.connectedScenes.first?.delegate as? SceneDelegate
    
    static let screen = sceneDelegate?.window?.screen
    
    static let screenSize = screen?.bounds.size
    
    static let scaleHeightConstant = {
        let val = 852.0 / (screen?.bounds.size.height ?? 852.0)
        return val >= 1 ? 1/val : val
    }()
    
    static let scaleWidthConstant = {
        let val = 393.0 / (screen?.bounds.size.width ?? 393.0)
        return val >= 1 ? 1/val : val
    }()
}
