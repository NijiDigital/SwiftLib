//
//  Collection+Utils.swift
//  Global
//
//  Created by Aymen Ben Romdhane on 03/08/2022.
//

import Foundation

public extension Collection {
    // swiftlint:disable identifier_name
    func chunk(n: Int) -> [SubSequence] {
        var res: [SubSequence] = []
        var i = startIndex
        var j: Index
        while i != endIndex {
            j = index(i, offsetBy: n, limitedBy: endIndex) ?? endIndex
            res.append(self[i..<j])
            i = j
        }
        return res
    }
}
