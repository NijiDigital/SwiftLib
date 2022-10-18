//
//  Array+Utils.swift
//  Global
//
//  Created by Nicolas RENAUD on 13/06/2022.
//

import Foundation

/// Utility extension for `Array`.
public extension Array {
    /// shift an array by a given distance
    ///
    /// - parameter distance: The distance to shift
    /// - returns: an array shifted
    func shift(withDistance distance: Int = 1) -> [Element] {
        let offsetIndex = distance >= 0 ?
            index(startIndex, offsetBy: distance, limitedBy: endIndex) :
            index(endIndex, offsetBy: distance, limitedBy: startIndex)
        guard let index = offsetIndex else { return self }
        return Array(self[index..<endIndex] + self[startIndex..<index])
    }
}
