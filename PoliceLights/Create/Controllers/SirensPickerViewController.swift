//
//  SirensPickerViewController.swift
//  PoliceLights
//
//  Created by sergey on 07.04.2024.
//

import UIKit

final class SirensPickerViewController: UIViewController {
    
    private let pickerView = SirensPickerView(frame: .zero)
    private let preview = SirensPreview(topView: PreviewLabel())
    private let deleteButton = RoundedButton()
    weak var framePicker: FramePickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setFrame(frame: SirenFrameModel) {
        preview.setFrame(frame: frame)
//        SirenFramesService.shared.currentFrame = preview.sirenFrame
    }
    
    @objc func deleteSiren(sender: UIButton) {
        preview.deleteSiren()
        framePicker?.setFrame(frame: preview.sirenFrame)
//        SirenFramesService.shared.currentFrame = preview.sirenFrame
    }
    
    private func setup() {
        pickerView.delegate = self
        deleteButton.addTarget(self, action: #selector(deleteSiren(sender:)), for: .touchUpInside)
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(pickerView)
        view.addSubview(preview)
        view.addSubview(deleteButton)
        setupDeleteButton()
        deleteButton.snap(to: view.safeAreaLayoutGuide, [.bottom,.trailing])
        NSLayoutConstraint.snap([deleteButton.leadingAnchor], [preview.trailingAnchor], constants: [16])
        pickerView.snap(to: view.safeAreaLayoutGuide, [.leading,.top,.trailing])
        preview.snap(to: view.safeAreaLayoutGuide, [.leading,.bottom])
        deleteButton.widthAnchor.constraint(equalToConstant: 127).isActive = true
    }
    
    private func setupDeleteButton() {
        deleteButton.setTitle("Delete", for: .normal)
        deleteButton.setImage(.Icons.delete, for: .normal)
        deleteButton.setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
    }
}

extension SirensPickerViewController: SirensPickerViewDelegate {
    func didPickSiren(siren: Siren) {
        preview.setSiren(siren: siren)
        framePicker?.setFrame(frame: preview.sirenFrame)
//        SirenFramesService.shared.currentFrame = preview.sirenFrame
    }
}
