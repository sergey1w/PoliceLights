//
//  ReadySirenCollectionViewCell.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import UIKit

final class ReadySirenCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = #function
    
    private let label = UILabel()
    private let buttonStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .leading
        stack.spacing = 8
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(label)
        contentView.addSubview(buttonStack)
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        buttonStack.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.snap(to: contentView, [.leading,.trailing,.top])
        buttonStack.snap(to: contentView, [.leading,.bottom])
        buttonStack.snap(to: label, [.trailing], .lessThanOrEqual)
        NSLayoutConstraint.snap([buttonStack.topAnchor], [label.bottomAnchor], constants: [8])
    }
    
    func configure(_ model: ReadySirenModel) {
        label.attributedText = NSAttributedString.attributedString(
            model.title.uppercased(),
            fontSize: 19,
            lineHeight: 24
        )
        buttonStack.addArrangedSubviews(
            (0..<model.sirens.count).map { index in
                makeButton(String(index + 1))
            }
        )
    }
    
    private func makeButton(_ title: String) -> RoundedButton {
        let btn = RoundedButton()
        btn.setTitle(title, for: .normal)
        btn.showBorder()
        btn.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 48).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return btn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
