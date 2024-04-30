//
//  SirenView.swift
//  PoliceLights
//
//  Created by sergey on 03.03.2024.
//

import UIKit

final class SirenView: UIView {
    
    private(set) var model = SirenFrame()
    private let sirenStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setFrame(frame: SirenFrame) {
        model = frame
        configureSirens(frame: frame)
    }
    
    private func setupUI() {
        setupSirenStackView()
    }
    
    private func setupSirenStackView() {
        addSubview(sirenStackView)
        sirenStackView.axis = .horizontal
        sirenStackView.spacing = 16
        sirenStackView.distribution = .fillEqually
        sirenStackView.alignment = .fill
        
        sirenStackView.snap(to: self, [.leading,.trailing,.top,.bottom])
        
        let sirens = (0..<4).map { _ in makeSirenImageView() }
        sirenStackView.addArrangedSubviews(sirens)
        configureSirens(frame: model)
    }
    
    private func configureSirens(frame: SirenFrame) {
        frame.sirens.enumerated().forEach { index, siren in
            let imgView = sirenStackView.arrangedSubviews[index] as? UIImageView
            imgView?.image = siren?.image
        }
    }
    
    private func makeSirenImageView() -> UIImageView {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        return imgView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
