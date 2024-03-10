//
//  ReadySirensHeaderFooterView.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import UIKit

final class ReadySirensHeaderFooterView: UICollectionReusableView {
    
    private let buttonGroup = RoundedButtonGroup<SirenSound>(offButton: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(buttonGroup)
        buttonGroup.snap(to: self, [.leading,.trailing,.top,.bottom])
        buttonGroup.configure(title: "Sirens", selections: SirenSound.allCases)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




//final class ReadySirensHeaderFooterView: UICollectionReusableView {
//    static let reuseID = #function
//    
//    
//    private let label = UILabel()
//    private let buttonStack = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.distribution = .equalSpacing
//        stack.alignment = .leading
//        stack.spacing = 8
//        return stack
//    }()
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setupUI()
//    }
//    
//    private func setupUI() {
//        addSubview(label)
//        addSubview(buttonStack)
//        label.snap(to: self, [.leading,.trailing,.top])
//        buttonStack.snap(to: self, [.leading,.bottom])
//        buttonStack.snap(to: label, [.trailing], .lessThanOrEqual)
//        NSLayoutConstraint.snap([buttonStack.topAnchor], [label.bottomAnchor], constants: [8])
//        label.attributedText = NSAttributedString.attributedString(
//            "Sirens",
//            fontSize: 19,
//            lineHeight: 24
//        )
//        buttonStack.removeArrangedSubviews()
//        buttonStack.addArrangedSubview(makeButton("Off"))
//        buttonStack.addArrangedSubviews(
//            (0..<5).map { index in
//                let btn = makeButton(String(index + 1))
////                btn.addTarget(nil, action: #selector(<#T##@objc method#>), for: .touchUpInside)
//                return btn
//            }
//        )
//    }
//    
//    private func makeButton(_ title: String) -> RoundedButton {
////        SirenViewController(model: <#T##SirenModel#>)
//        let btn = RoundedButton()
//        btn.setTitle(title, for: .normal)
//        btn.showBorder()
//        btn.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//        btn.translatesAutoresizingMaskIntoConstraints = false
//        btn.widthAnchor.constraint(equalToConstant: 48).isActive = true
//        btn.heightAnchor.constraint(equalToConstant: 48).isActive = true
//        return btn
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
