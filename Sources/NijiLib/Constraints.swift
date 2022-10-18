//
//  Constraints.swift
//  Global
//
//  Created by Aymen Ben Romdhane on 29/07/2022.
//

#if !os(macOS)
import UIKit

@IBDesignable
class Constraints: NSLayoutConstraint {
    @IBInspectable
    var under5inch: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY <= 667 {
                constant = under5inch
            }
        }
    }

    @IBInspectable
    var between5and6Inch: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY > 667, UIScreen.main.bounds.maxY <= 844 {
                constant = between5and6Inch
            }
        }
    }

    @IBInspectable
    var over6inch: CGFloat = 0 {
        didSet {
            if UIScreen.main.bounds.maxY > 844 {
                constant = over6inch
            }
        }
    }
}
#endif
