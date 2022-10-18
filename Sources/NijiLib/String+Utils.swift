//
//  String+Utils.swift
//  Global
//
//  Created by Nicolas RENAUD on 21/06/2022.
//

#if !os(macOS)
import Foundation
import UIKit

/// Utility extension for `String`.
public extension String {
    func camelcased() -> String {
        prefix(1).capitalized + dropFirst()
    }

    func chunkFormatted(withChunkSize chunkSize: Int = 2,
                        withSeparator separator: Character = " ") -> String {
        filter { $0 != separator }.chunk(n: chunkSize)
            .map { String($0) }.joined(separator: String(separator))
    }
    
    func postalCodeFormatted() -> String {
        "\(prefix(2)) \(dropFirst(2))".trimmingCharacters(in: .whitespaces)
    }
    
    func height(withConstrainedWidth width: CGFloat,
                font: UIFont,
                lineSpacing: CGFloat = 1,
                lineHeightMultiple: CGFloat = 1) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        // swiftformat:disable:next redundantSelf
        let boundingBox = self.boundingRect(with: constraintRect,
                                            options: .usesLineFragmentOrigin,
                                            attributes: [
                                                NSAttributedString.Key.font: font,
                                                NSAttributedString.Key.paragraphStyle: paragraphStyle
                                            ],
                                            context: nil)
        return ceil(boundingBox.height)
    }
    
    var luckyDateFormatted: String? {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM-dd"
        if let date = formatter.date(from: self) {
            formatter.dateFormat = "dd / MM"
            return formatter.string(from: date)
        }
        return nil
    }
}
#endif
