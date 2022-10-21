//
//  CGFloat+Utils.swift
//

public extension CGFloat {
    var absoluteValue: CGFloat {
        if self < 0 {
            return -self
        } else {
            return self
        }
    }
}
