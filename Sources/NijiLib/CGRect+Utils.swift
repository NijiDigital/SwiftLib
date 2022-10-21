//
//  CGRect+Extension.swift
//  PersoLips
//
//  Created by Himalaya on 14/07/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
//

import Foundation

public extension CGRect {
    func getPixels(from imageView: UIImageView) -> [UIColor] {
        let offset = size.width
        let originX = origin.x
        let originY = origin.y
        var pixels = [UIColor]()
        for x in stride(from: originX, through: originX + offset, by: 1) {
            for y in stride(from: originY, through: originY + offset, by: 1) {
                pixels.append(imageView.colorOfPoint(point: CGPoint(x: x, y: y)))
            }
        }
        return pixels
    }
}
