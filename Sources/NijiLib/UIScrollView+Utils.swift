//
//  UIScrollView+Utils.swift
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
