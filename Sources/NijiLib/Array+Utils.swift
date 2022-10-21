//
//  Array+Utils.swift
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

public extension Sequence where Iterator.Element: Hashable {
    /// Return an array with only unique values
    func unique() -> [Iterator.Element] {
        var seen: Set<Iterator.Element> = []
        return filter { seen.insert($0).inserted }
    }
}

public extension Sequence where Element: Hashable {
    /// Return dictionary that counts the number of occurrences for each element
    var histogram: [Element: Int] {
        reduce(into: [:]) { counts, elem in counts[elem, default: 0] += 1 }
    }
}
