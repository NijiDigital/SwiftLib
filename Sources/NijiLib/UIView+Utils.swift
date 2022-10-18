//
//  UIView+Utils.swift
//  Global
//
//  Created by Nicolas RENAUD on 15/10/2021.
//

#if !os(macOS)
import UIKit

/// Utility extension for `UIView`.
public extension UIView {
    /// Apply border width and color.
    ///
    /// - Parameters:
    ///    - width: The border width
    ///    - color: The border color
    func setBorder(_ width: CGFloat = 0.0, color: UIColor = .clear) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
    
    /// Round corners with a defined radius, half of height if nil.
    ///
    /// - Parameters:
    ///    - radius: The corner radius
    func roundCorners(_ radius: CGFloat? = nil) {
        layer.masksToBounds = true
        layer.cornerRadius = radius ?? frame.height / 2.0
    }
    
    /// Rotate the view by specified angle.
    ///
    /// - Parameter angle: angle in degrees
    func rotate(angle: CGFloat) {
        let radians = angle * .pi / 180.0
        transform = transform.rotated(by: radians)
    }
    
    /// Translate the view by a specified offset.
    ///
    /// - Parameters:
    ///   - xOffset: The offset on x axis.
    ///   - yOffset: The offset on y axis.
    func translateBy(xOffset: CGFloat, yOffset: CGFloat) {
        transform = transform.translatedBy(x: xOffset, y: yOffset)
    }
    
    /// Return the subview in content matching type and predicate if exists.
    ///
    /// - Parameters:
    ///    - type: The type of the UIView
    ///    - predicate: The predicate to match
    func subviewInContent<T: UIView>(type: T.Type, predicate: ((T) -> Bool)? = nil) -> T? {
        subviews.compactMap { subview -> T? in
            if let type = subview as? T {
                if let predicate = predicate {
                    if predicate(type) {
                        return type
                    }
                } else {
                    return type
                }
            }
            return subview.subviewInContent(type: type, predicate: predicate)
        }.first
    }
    
    /// Return all the subviews in content matching type and predicate if exists.
    ///
    /// - Parameters:
    ///    - type: The type of the UIView
    ///    - predicate: The predicate to match
    func subviewsInContent<T: UIView>(type: T.Type, predicate: ((T) -> Bool)? = nil) -> [T] {
        subviews.compactMap { subview in
            if let type = subview as? T {
                if let predicate = predicate {
                    if predicate(type) {
                        return type
                    }
                } else {
                    return type
                }
            }
            return nil
        }
    }
}

// MARK: - Dashed border

public extension UIView {
    enum ViewSide: String {
        case leftBorder
        case rightBorder
        case topBorder
        case bottomBorder
        
        var borderName: String {
            "DashBorderLayer" + rawValue
        }
    }
    
    func addDashedBorders(toSides sides: [ViewSide], withColor cgColor: CGColor) {
        sides.forEach { addDashedBorder(withSide: $0, withColor: cgColor) }
    }
    
    func removeDashedBorder(withSide side: ViewSide) {
        layer.sublayers?.removeAll { $0.name == side.borderName }
    }
    
    func addDashedBorder(withSide side: ViewSide, withColor cgColor: CGColor) {
        removeDashedBorder(withSide: side)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = layer.bounds
        shapeLayer.name = side.borderName
        shapeLayer.strokeColor = cgColor
        shapeLayer.lineWidth = 1
        shapeLayer.lineDashPattern = [3, 3]
        
        let startPoint: CGPoint
        let endPoint: CGPoint
        
        switch side {
        case .leftBorder:
            startPoint = CGPoint(x: bounds.minX, y: bounds.minY)
            endPoint = CGPoint(x: bounds.minX, y: bounds.maxY)
        case .rightBorder:
            startPoint = CGPoint(x: bounds.maxX, y: bounds.minY)
            endPoint = CGPoint(x: bounds.maxX, y: bounds.maxY)
        case .topBorder:
            startPoint = CGPoint(x: bounds.minX, y: bounds.minY)
            endPoint = CGPoint(x: bounds.maxX, y: bounds.minY)
        case .bottomBorder:
            startPoint = CGPoint(x: bounds.minX, y: bounds.maxY)
            endPoint = CGPoint(x: bounds.maxX, y: bounds.maxY)
        }
        
        let path = CGMutablePath()
        path.addLines(between: [startPoint, endPoint])
        shapeLayer.path = path
  
        layer.addSublayer(shapeLayer)
    }
}
#endif
