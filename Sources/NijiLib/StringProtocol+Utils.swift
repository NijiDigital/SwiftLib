//
//  StringProtocol+Extension.swift
//  PersoLips
//
//  Created by Himalaya Rajput on 08/09/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
//

public extension StringProtocol {
  var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
  var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}
