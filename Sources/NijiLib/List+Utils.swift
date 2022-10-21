//
//  List+Utils.swift
//

import RealmSwift

public extension List {
    func toArray<T>() -> [T] {
        var array = [T]()
        for i in 0..<count {
            if let result = self[i] as? T {
                array.append(result)
            }
        }
        return array
    }
}
