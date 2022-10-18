//
//  Int+Utils.swift
//  Global
//
//  Created by Mathieu VIEL on 07/09/2022.
//

import Foundation

public extension Int {
    var formattedWithNumberStyle: String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
