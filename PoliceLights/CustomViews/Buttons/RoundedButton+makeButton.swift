//
//  RoundedButton+makeButton.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation

extension RoundedButton {
    static func saveButton() -> RoundedButton {
        let btn = RoundedButton()
        btn.setTitle("Save", for: .normal)
        btn.setSelected()
        btn.setImage(.Icons.tickSquare, for: .normal)
        btn.tintColor = .white
        btn.bringSubviewToFront(btn.imageView ?? btn) // ios bug
        btn.setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
        return btn
    }
    
    static func deleteButton() -> RoundedButton {
        let btn = RoundedButton()
        btn.setTitle("Delete", for: .normal)
        btn.setImage(.Icons.delete, for: .normal)
        btn.setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
        return btn
    }
}
