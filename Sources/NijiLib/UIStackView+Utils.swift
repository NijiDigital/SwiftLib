//
//  UIStackView+Extension.swift
//  PersoLips
//
//  Created by Himalaya Rajput on 01/11/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
//

import Foundation

public extension UIStackView {
  func removeAll() {
    arrangedSubviews.forEach { $0.removeFromSuperview() }
  }
}
