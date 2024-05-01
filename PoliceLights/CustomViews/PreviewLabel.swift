//
//  PreviewLabel.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import UIKit

final class PreviewLabel: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI() {
        let previewIcon = UIImageView(image: UIImage.Icons.image2)
        previewIcon.tintColor = .Colors.white
        let previewLabel = UILabel()
        previewLabel.text = "PREVIEW"
        previewLabel.font = .systemFont(ofSize: 19, weight: .medium)
        previewLabel.setContentHuggingPriority(.init(1), for: .horizontal)
        previewLabel.textColor = .Colors.white
        
        let titleStack = UIStackView(arrangedSubviews: [previewIcon, previewLabel])
        titleStack.axis = .horizontal
        titleStack.distribution = .fill
        titleStack.spacing = 8
        titleStack.alignment = .bottom
        addSubview(titleStack)
        titleStack.snap(to: self, [.leading,.trailing,.top,.bottom])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
