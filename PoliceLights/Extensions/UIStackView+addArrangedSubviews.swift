//
//  UIStackView+addArrangedSubviews.swift
//  Food3-ios
//
//  Created by sergey on 12.09.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
    
    func removeArrangedSubviews() {
        arrangedSubviews.forEach { view in
            removeArrangedSubview(view)
        }
    }
}
