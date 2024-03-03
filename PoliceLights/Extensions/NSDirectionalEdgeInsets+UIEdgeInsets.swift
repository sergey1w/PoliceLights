//
//  NSDirectionalEdgeInsets+UIEdgeInsets.swift
//  Food3-ios
//
//  Created by sergey on 13.09.2023.
//

import UIKit

extension NSDirectionalEdgeInsets {
    static func tuple( _ tuple: (
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat)) -> Self {
        return .init(
            top: tuple.top,
            leading: tuple.leading,
            bottom: tuple.bottom,
            trailing: tuple.trailing
        )
    }
    func uiEdgeInsets() -> UIEdgeInsets {
        return .init(
            top: top,
            left: leading,
            bottom: bottom,
            right: trailing
        )
    }
}

extension UIEdgeInsets {
    static func tuple( _ tuple: (
        top: CGFloat,
        leading: CGFloat,
        bottom: CGFloat,
        trailing: CGFloat)) -> Self {
        return .init(
            top: tuple.top,
            left: tuple.leading,
            bottom: tuple.bottom,
            right: tuple.trailing
        )
    }
    
    func nsDirectionalEdgeInsets() -> NSDirectionalEdgeInsets {
        return .init(
            top: top,
            leading: left,
            bottom: bottom,
            trailing: right
        )
    }
}
