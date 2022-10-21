//
//  UIScrollView+Extension.swift
//  shootproof
//
//  Created by Quentin EONO on 03/03/2021.
//  Copyright © 2021 Niji. All rights reserved.
//

import UIKit

public extension UIScrollView {
  func isBottomReached() -> Bool {
    contentOffset.y >= contentSize.height - frame.size.height
  }
  
  func canScroll() -> Bool {
    contentSize.height > bounds.height
  }
}
