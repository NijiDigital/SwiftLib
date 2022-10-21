//
//  CGFloat+Extension.swift
//  PersoLips
//
//  Created by Satish Chauhan on 21/07/20.
//  Copyright © 2020 L'Oréal. All rights reserved.
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
