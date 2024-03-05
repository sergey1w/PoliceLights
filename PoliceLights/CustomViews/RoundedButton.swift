//
//  RoundedButton.swift
//  PoliceLights
//
//  Created by sergey on 05.03.2024.
//

import UIKit

final class RoundedButton: UIButton {
    
    private let gradientLayer = CAGradientLayer.gradientLayer(in: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        guard let title = title else { return }
        let attributedTitle = attributedString(title)
        setAttributedTitle(attributedTitle, for: state)
    }
    
    func setSelected() {
        gradientLayer.isHidden = false
    }
    
    func setNormal() {
        gradientLayer.isHidden = true
    }
    
    func hideBorder() {
        layer.borderWidth = 0
    }
    
    func showBorder() {
        layer.borderWidth = 1
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RoundedButton {
    override var isHighlighted: Bool {
        didSet {
            guard oldValue != self.isHighlighted else { return }
            UIView.animate(withDuration: 0.25, delay: 0, options: [
                .beginFromCurrentState,
                .allowUserInteraction
            ]) {
                self.alpha = self.isHighlighted ? 0.8 : 1
            }
        }
    }
}

// MARK: Private methods
private extension RoundedButton {
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
}

// MARK: UI Setup
private extension RoundedButton {
    private func setupUI() {
        layer.cornerRadius = Constants.cornerRadius
        layer.backgroundColor = Constants.backgroundColor
        layer.masksToBounds = true
        layer.insertSublayer(gradientLayer, at: 0)
        layer.borderColor = Constants.borderColor
        setNormal()
        hideBorder()
    }
}

private extension RoundedButton {
    enum Constants {
        static let cornerRadius: CGFloat = 14
        static let fontSize: CGFloat = 19
        static let lineHeight: CGFloat = 24
        static let backgroundColor = UIColor.Colors.black.cgColor
        static let borderColor = UIColor.Colors.gray.cgColor
    }
}
