//
//  SirensPreview.swift
//  PoliceLights
//
//  Created by sergey on 07.04.2024.
//

import UIKit

final class SirensPreview: UIView {
    
    private let sirenStackView = UIStackView()
    
    private(set) var sirenFrame = SirenFrameModel()
    
    private(set) var selectedIndex: Int?
    
    private let topView: UIView
    
    init(topView: UIView) {
        self.topView = topView
        super.init(frame: .zero)
        setup()
    }
    
    func setFrame(frame: SirenFrameModel) {
        sirenFrame = frame
        for i in 0..<frame.sirens.count {
            let btn = sirenStackView.arrangedSubviews[i] as? UIButton
            btn?.setImage(frame.sirens[i]?.image, for: .normal)
        }
    }
    
    func setSiren(siren: Siren) {
        guard let selectedIndex else { return }
        let button = sirenStackView.arrangedSubviews[selectedIndex] as? UIButton
        sirenFrame[selectedIndex] = siren
        button?.setImage(siren.image, for: .normal)
    }
    
    func deleteSiren() {
        guard let selectedIndex else { return }
        let button = sirenStackView.arrangedSubviews[selectedIndex] as? UIButton
        sirenFrame[selectedIndex] = nil
        button?.setImage(nil, for: .normal)
    }
    
    @objc private func selectSiren(sender: UIButton) {
        let index = sender.tag - 1
        selectedIndex = index
        setBorder(for: sirenStackView.arrangedSubviews[index])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SirensPreview {
    
    private func setup() {
        setupUI()
    }
    
    private func setupUI() {
        addSubview(topView)
        addSubview(sirenStackView)
        
        topView.snap(to: self, [.leading,.top,.trailing])
        sirenStackView.snap(to: self, [.leading,.bottom,.trailing])
        NSLayoutConstraint.snap([topView.bottomAnchor], [sirenStackView.topAnchor], constants: [-8])
        setupSirenStackView()
    }
    
    private func setupSirenStackView() {
        sirenStackView.axis = .horizontal
        sirenStackView.alignment = .leading
        sirenStackView.distribution = .fill
        sirenStackView.spacing = 8
        sirenStackView.alignment = .center
        
        let sirens = (0..<4).map { index in
            let button = makeSirenButton()
            button.tag = index + 1
            return button
        }
        sirenStackView.addArrangedSubviews(sirens)
    }
    
    private func makeSirenButton() -> UIButton {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFill
        button.backgroundColor = .Colors.black
        let size = UIImage.Lights.red.size
        button.heightAnchor.constraint(equalToConstant: size.height).isActive = true
        button.widthAnchor.constraint(equalToConstant: size.width).isActive = true
        button.addTarget(self, action: #selector(selectSiren(sender:)), for: .touchUpInside)
        button.roundCorners(10)
        return button
    }
    
    private func setBorder(for button: UIView) {
        sirenStackView.arrangedSubviews.forEach { $0.layer.borderWidth = 0 }
        button.layer.borderWidth = 4
        button.layer.borderColor = UIColor.yellow.cgColor
    }
}
