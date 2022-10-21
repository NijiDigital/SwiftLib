//
//  List+Extension.swift
//  PersoLips
//
//  Created by Himalaya Rajput on 24/05/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
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
