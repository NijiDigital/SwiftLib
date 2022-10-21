//
//  URL+Extension.swift
//  PersoLips
//
//  Created by Himalaya Rajput on 19/05/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
//

import Foundation

public extension URL {
  var isValid: Bool {
    UIApplication.shared.canOpenURL(self)
  }
}
