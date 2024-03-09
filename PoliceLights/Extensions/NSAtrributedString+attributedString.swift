//
//  NSAtrributedString+attributedString.swift
//  PoliceLights
//
//  Created by sergey on 10.03.2024.
//

import UIKit

extension NSAttributedString {
    static func attributedString(_ str: String, fontSize: CGFloat, lineHeight: CGFloat) -> NSAttributedString {
        let font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight - fontSize - (font.lineHeight - font.pointSize)
        let attributes: [NSAttributedString.Key: Any] = [
            .font : font,
            .foregroundColor: UIColor.Colors.white,
            .paragraphStyle : paragraphStyle
        ]
        let attrStr = NSAttributedString(string: str, attributes: attributes)
        return attrStr
    }
}
