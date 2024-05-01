//
//  CreatedSirenCollectionViewCell.swift
//  PoliceLights
//
//  Created by sergey on 30.04.2024.
//

import UIKit

final class CreatedSirenCollectionViewCell: UICollectionViewCell {
    static let reuseID = #function
    
    private let nameLabel = UILabel()
    private let preview: SirensPreview
    private let deleteButton = RoundedButton.deleteButton()
    var onDeleteSiren: (() -> Void)?
    
    override init(frame: CGRect) {
        self.preview = SirensPreview(topView: nameLabel)
        super.init(frame: frame)
        setup()
    }
    
    func configure(model: SirenModel) {
        nameLabel.text = model.name
        preview.setFrame(frame: model.frames.first ?? .init())
    }
    
    @objc private func deleteCreatedSiren() {
        onDeleteSiren?()
    }
    
    private func setup() {
        preview.isUserInteractionEnabled = false
        nameLabel.textColor = .white
        deleteButton.addTarget(self, action: #selector(deleteCreatedSiren), for: .touchUpInside)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(preview)
        contentView.addSubview(deleteButton)
        preview.snap(to: self.contentView, [.leading,.top,.bottom])
        deleteButton.snap(to: self.contentView, [.trailing,.bottom])
        NSLayoutConstraint.snap([preview.trailingAnchor], [deleteButton.leadingAnchor], constants: [-8])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
