//
//  UIView+Constraints.swift
//
//  Created by sergey on 01.08.2023.
//

import UIKit

protocol Constrainable {}

extension UILayoutGuide: Constrainable {}
extension UIView: Constrainable {}

extension UIView {
    
    /// Pins attributes of view to same attributes of other view's layout guide
    /// - Parameters:
    ///   - guide: layout guide
    ///   - attributes: array of NSLayoutConttributes
    ///   - constant: constant added to const
    func snap<T: Constrainable>(
        to: T,
        _ attributes: [NSLayoutConstraint.Attribute],
        _ relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
    ) {
        translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        attributes.forEach { attribute in
            var constant = constant
            switch attribute {
            case .trailing,.trailingMargin,.bottom,.bottomMargin:
                constant.negate()
            default: break
            }
            let constraint = NSLayoutConstraint(
                item: self,
                attribute: attribute,
                relatedBy: relation,
                toItem: to,
                attribute: attribute,
                multiplier: 1,
                constant: constant
            )
            constraints.append(constraint)
        }
        NSLayoutConstraint.activate(constraints)
    }
}

extension UILayoutGuide {
    /// Pins attributes of layout guide to same attributes of another layout guide
    /// - Parameters:
    ///   - guide: layout guide
    ///   - attributes: array of NSLayoutConttributes
    ///   - constant: constant added to const
    func snap(
        to: UILayoutGuide,
        _ attributes: [NSLayoutConstraint.Attribute],
        _ relation: NSLayoutConstraint.Relation = .equal,
        constant: CGFloat = 0
    ) {
        owningView?.translatesAutoresizingMaskIntoConstraints = false
        var constraints: [NSLayoutConstraint] = []
        attributes.forEach { attribute in
            var constant = constant
            switch attribute {
            case .trailing,.trailingMargin,.bottom,.bottomMargin:
                constant.negate()
            default: break
            }
            let constraint = NSLayoutConstraint(
                item: self,
                attribute: attribute,
                relatedBy: relation,
                toItem: to,
                attribute: attribute,
                multiplier: 1,
                constant: constant
            )
            constraints.append(constraint)
        }
        NSLayoutConstraint.activate(constraints)
    }
}
