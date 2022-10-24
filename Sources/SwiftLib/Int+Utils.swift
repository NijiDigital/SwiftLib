//
//  Int+Utils.swift
//

import Foundation

public extension Int {
    var formattedWithNumberStyle: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
