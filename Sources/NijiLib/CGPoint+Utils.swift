//
//  CGPoint+Extension.swift
//  PersoLips
//
//  Created by vinsol on 07/10/20.
//  Copyright © 2020 L'Oréal. All rights reserved.
//

import Foundation

public extension CGPoint {
    func distanceSquared(to: CGPoint) -> CGFloat {
        (x - to.x) * (x - to.x) + (y - to.y) * (y - to.y)
    }

    func distance(to: CGPoint) -> CGFloat {
        sqrt(distanceSquared(to: to))
    }

    func convertToCGRect(offset: CGFloat) -> CGRect {
        CGRect(x: x - offset, y: y - offset, width: offset * 2, height: offset * 2)
    }
}
