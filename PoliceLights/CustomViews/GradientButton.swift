//
//  GradientButton.swift
//  PoliceLights
//
//  Created by sergey on 24.02.2024.
//

import UIKit

final class GradientButton: UIButton {
    
    private let gradientLayer = CAGradientLayer.gradientLayer(in: .zero)
    
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.cornerRadius = Constants.cornerRadius
        gradientLayer.frame = bounds
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        guard let title = title else { return }
        let attributedTitle = attributedString(title)
        setAttributedTitle(attributedTitle, for: state)
    }
    
    private func setupUI() {
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func attributedString(_ str: String) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: Constants.fontSize, weight: .medium)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = Constants.lineHeight - Constants.fontSize - (font.lineHeight - font.pointSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font : font,
            .foregroundColor: UIColor.Colors.white,
            .paragraphStyle : paragraphStyle
        ]
        let attrStr = NSAttributedString(string: str, attributes: attributes)
        return attrStr
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension GradientButton {
    enum Constants {
        static let cornerRadius: CGFloat = 14
        static let fontSize: CGFloat = 19
        static let lineHeight: CGFloat = 24
    }
}
