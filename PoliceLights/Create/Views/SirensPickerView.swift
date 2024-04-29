//
//  SirensPickerView.swift
//  PoliceLights
//
//  Created by sergey on 31.03.2024.
//

import UIKit

protocol SirensPickerViewDelegate: AnyObject {
    func didPickSiren(siren: Siren) -> Void
}

final class SirensPickerView: UIView {
    
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 8
        stack.distribution = .equalSpacing
        stack.alignment = .center
        return stack
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsHorizontalScrollIndicator = false
        scroll.showsVerticalScrollIndicator = false
        return scroll
    }()
    
    weak var delegate: SirensPickerViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @objc private func selectSiren(sender: UIButton) {
        guard let siren = Siren.hashTable[sender.tag] else { return }
        delegate?.didPickSiren(siren: siren)
    }
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        addSubview(scrollView)
        scrollView.frameLayoutGuide.snap(to: self.safeAreaLayoutGuide, [.leading,.trailing,.top,.bottom])
        scrollView.addSubview(stackView)
        stackView.snap(to: scrollView.contentLayoutGuide, [.leading,.trailing,.bottom,.top])
        NSLayoutConstraint.snap([scrollView.heightAnchor], [stackView.heightAnchor])
        
        Siren.allCases.forEach { siren in
            let button = UIButton()
            button.setImage(siren.image, for: .normal)
            button.tag = siren.hashValue
            button.addTarget(self, action: #selector(selectSiren(sender:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
