//
//  UILabel+Utils.swift
//  Global
//
//  Created by Aymen Ben Romdhane on 19/08/2022.
//

#if !os(macOS)
import Foundation
import UIKit

public extension UILabel {
    func setLineSpacing(lineSpacing: CGFloat = 1.3, lineHeightMultiple: CGFloat = 1.3) {
        guard let labelText = text else {
            return
        }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        let attributedString: NSMutableAttributedString
        if let labelattributedText = attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        attributedText = attributedString
    }
}
#endif
