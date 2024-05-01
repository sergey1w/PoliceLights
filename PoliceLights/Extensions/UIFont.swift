//
//  UIFont.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import UIKit

extension UIFont {
    static let H1 = systemFont(ofSize: 36, weight: .bold)
    static let H2 = systemFont(ofSize: 25, weight: .bold)
    static let title1 = systemFont(ofSize: 25, weight: .medium)
    static let title2 = systemFont(ofSize: 19, weight: .medium)
    static let subtitle1 = systemFont(ofSize: 17, weight: .medium)
    static let body1 = systemFont(ofSize: 17, weight: .regular)
    static let button = systemFont(ofSize: 17, weight: .medium)
    
    
    enum TextAttributes  {
        static let H1: [NSAttributedString.Key : Any] = [
            .font: UIFont.H1
        ]
    }
}
