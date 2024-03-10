//
//  RoundedButtonGroup.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import UIKit

final class RoundedButtonGroup<Selection>: UIView {
    
    private(set) var selection: Selection?
    private(set) var selections: [Selection] = []
    private let offButton: Bool
    
    init(offButton: Bool = false) {
        self.offButton = offButton
        super.init(frame: .zero)
        setupUI()
    }
    
    private let label = UILabel()
    private let stackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .leading
        return stack
    }()
    private let buttonStack = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .bottom
        stack.spacing = 8
        return stack
    }()
    
    private func setupUI() {
        addSubview(stackView)
        stackView.addArrangedSubviews([label, buttonStack])
        stackView.snap(to: self, [.leading,.top,.bottom,.trailing])
    }
    
    func configure(title: String, selections: [Selection]) {
        label.attributedText = NSAttributedString.attributedString(
            title,
            fontSize: 19,
            lineHeight: 24
        )
        self.selections = selections
        buttonStack.removeArrangedSubviews()
        if offButton {
            let offButton = makeButton("Off")
            offButton.tag = -1
            offButton.addTarget(self, action: #selector(testmethod(sender:)), for: .touchUpInside)
            buttonStack.addArrangedSubview(offButton)
        }
        buttonStack.addArrangedSubviews(
            (0..<selections.count).map { index in
                let button = makeButton(String(index + 1))
                button.tag = index + 1
                button.addTarget(self, action: #selector(testmethod(sender:)), for: .touchUpInside)
                return button
            }
        )
    }
    
    @objc private func testmethod(sender: RoundedButton) {
        let tag = sender.tag
        guard tag <= selections.count else { return }
        if tag < 0 {
            selection = nil
        } else {
            selection = selections[tag - 1]
        }
    }
    
    private func makeButton(_ title: String) -> RoundedButton {
        let btn = RoundedButton()
        btn.setTitle(title, for: .normal)
        btn.showBorder()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.widthAnchor.constraint(equalToConstant: 48).isActive = true
        btn.heightAnchor.constraint(equalToConstant: 48).isActive = true
        return btn
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
