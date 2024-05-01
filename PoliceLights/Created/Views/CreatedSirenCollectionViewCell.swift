//
//  CreatedSirenCollectionViewCell.swift
//  PoliceLights
//
//  Created by sergey on 30.04.2024.
//

import UIKit

final class CreatedSirenCollectionViewCell: UICollectionViewCell {
    static let reuseID = #function
    
    private let preview = SirensPreview()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func configure(model: SirenModel) {
        preview.setFrame(frame: model.frames.first ?? .init())
    }
    
    private func setupUI() {
        contentView.addSubview(preview)
        preview.snap(to: self.contentView, [.leading,.trailing,.top,.bottom])
        preview.isUserInteractionEnabled = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
