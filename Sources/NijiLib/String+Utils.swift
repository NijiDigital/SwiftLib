//
//  String+Utils.swift
//

#if !os(macOS)
import Foundation
import UIKit

/// Utility extension for `String`.
public extension String {
    func capitalized() -> String {
        prefix(1).uppercased() + dropFirst()
    }

    func camelcased() -> String {
        let source = lowercased()
        let first = source[..<source.index(after: source.startIndex)]
        if source.contains(" ") {
            let connected = source.capitalized.replacingOccurrences(of: " ", with: "")
            let camel = connected.replacingOccurrences(of: "\n", with: "")
            let rest = String(camel.dropFirst())
            return first + rest
        }
        let rest = String(source.dropFirst())
        return first + rest
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
}
#endif
