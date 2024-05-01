//
//  RoundedButton+makeButton.swift
//  PoliceLights
//
//  Created by sergey on 01.05.2024.
//

import Foundation

extension RoundedButton {
    enum ActionType {
        case save
        case delete
    }
    
    func makeButton(type: ActionType) {
        switch type {
        case .save:
            setTitle("Save", for: .normal)
            setSelected()
            setImage(.Icons.tickSquare, for: .normal)
            tintColor = .white
            bringSubviewToFront(imageView ?? self) // ios bug
            setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
        case .delete:
            setTitle("Delete", for: .normal)
            setImage(.Icons.delete, for: .normal)
            setInsets(forContentPadding: .tuple((12,12,12,12)), imageTitlePadding: 8)
        }
    }
}
