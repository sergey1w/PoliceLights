//
//  ReadySirensHeaderFooterView.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import UIKit

final class ReadySirensHeaderFooterView: UICollectionReusableView {
    
    let buttonGroup = RoundedButtonGroup<SirenSound>(offButton: true)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        addSubview(buttonGroup)
        buttonGroup.snap(to: self, [.leading,.trailing,.top,.bottom])
        configure(title: "Sirens", selections: SirenSound.allCases)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReadySirensHeaderFooterView: RoundedButtonGroupContainer {
    func setDelegate(_ delegate: RoundedButtonGroupDelegate) {
        buttonGroup.delegate = delegate
    }
    
    func configure(title: String, selections: [SirenSound]) {
        buttonGroup.configure(title: "Sirens", selections: SirenSound.allCases)
    }
}
