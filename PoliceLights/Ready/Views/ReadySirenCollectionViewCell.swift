//
//  ReadySirenCollectionViewCell.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import UIKit

final class ReadySirenCollectionViewCell: UICollectionViewCell {
    static let reuseID = #function
    
    let buttonGroup = RoundedButtonGroup<Selection>(offButton: false, selectable: false)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(buttonGroup)
        buttonGroup.snap(to: self.contentView, [.leading,.trailing,.top,.bottom])
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReadySirenCollectionViewCell: RoundedButtonGroupContainer {
    typealias Selection = ReadySiren
    
    func setDelegate(_ delegate: RoundedButtonGroupDelegate) {
        buttonGroup.delegate = delegate
    }
    
    func configure(title: String, selections: [Selection]) {
        buttonGroup.configure(title: title, selections: selections)
    }
}
