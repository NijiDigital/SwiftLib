//
//  URL+Utils.swift
//

import Foundation

public extension URL {
    var isValid: Bool {
        UIApplication.shared.canOpenURL(self)
    }
}
