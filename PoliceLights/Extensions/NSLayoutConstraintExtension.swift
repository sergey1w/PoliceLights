//
//  NSLayoutConstraintExtension.swift
//
//  Created by sergey on 01.08.2023.
//

import UIKit

extension NSLayoutConstraint  {
    
    /// Pins n-th anchor of lAnchors to n-th anchor or rAnchors
    /// - Parameters:
    ///   - lAnchors: array of NSLayoutAnchor's of left
    ///   - rAnchors: array of NSLayoutAnchor's
    ///   - constants: constant added to n-th constraint
    /// - Note: Order of anchors matters.
    /// 
    /// Make sure that translatesAutoresizingMaskIntoConstraints is set to false!
    static func snap<T>(
        _ lAnchors: [NSLayoutAnchor<T>],
        _ rAnchors: [NSLayoutAnchor<T>],
        _ relation: NSLayoutConstraint.Relation = .equal,
        constants: [CGFloat]? = nil
    ) where T: AnyObject  {
        guard lAnchors.count == rAnchors.count else {
            return
        }
        var localCostants = [CGFloat](repeating: 0, count: lAnchors.count)
        if let constants = constants {
            for i in 0..<constants.count {
                localCostants[i] = constants[i]
            }
        }
        var constraints: [NSLayoutConstraint] = []
        for i in 0..<lAnchors.count {
            let constraint: NSLayoutConstraint
            switch relation {
            case .lessThanOrEqual:
                constraint = lAnchors[i].constraint(lessThanOrEqualTo: rAnchors[i], constant: localCostants[i])
            case .equal:
                constraint = lAnchors[i].constraint(equalTo: rAnchors[i], constant: localCostants[i])
            case .greaterThanOrEqual:
                constraint = lAnchors[i].constraint(greaterThanOrEqualTo: rAnchors[i], constant: localCostants[i])
            @unknown default: continue
            }
            constraints.append(constraint)
        }
        NSLayoutConstraint.activate(constraints)
    }
}
