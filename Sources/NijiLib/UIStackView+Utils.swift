//
//  UIStackView+Utils.swift
//

import Foundation

public extension UIStackView {
    func removeAll() {
        arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
}
