//
//  UIViewController+Extension.swift
//  Barriere
//
//  Created by Malek Mansour on 20/06/2022.
//

#if !os(macOS)
import Foundation
import UIKit

public enum GradientDirection {
    case horizontal
    case vertical
    case diagonalUp
    case diagonalDown
}

public extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        color.setFill()
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        let rect = CGRect(origin: .zero, size: CGSize(width: size.width, height: size.height))
        context?.clip(to: rect, mask: cgImage!)
        context?.fill(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    /// Returns a gradient version of the receiver.
    ///
    /// - Returns: A gradient version of the receiver.
    func fillWithGradient(colors: [CGColor], direction: GradientDirection = .vertical) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        guard let maskImage = cgImage,
              let context = UIGraphicsGetCurrentContext(),
              let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(),
                                        colors: colors as CFArray,
                                        locations: nil) else {
            return nil
        }
        context.translateBy(x: 0, y: size.height)
        context.scaleBy(x: 1, y: -1)
        context.setBlendMode(.normal)
        context.clip(to: CGRect(x: 0, y: 0, width: size.width, height: size.height), mask: maskImage)
                
        let startPoint: CGPoint
        let endPoint: CGPoint

        switch direction {
        case .vertical:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: 0, y: size.height)
        case .horizontal:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: size.width, y: 0)
        case .diagonalUp:
            startPoint = CGPoint(x: 0, y: size.height)
            endPoint = CGPoint(x: size.width, y: 0)
        case .diagonalDown:
            startPoint = CGPoint(x: 0, y: 0)
            endPoint = CGPoint(x: size.width, y: size.height)
        }

        context.drawLinearGradient(gradient,
                                   start: startPoint,
                                   end: endPoint,
                                   options: .drawsAfterEndLocation)
        let gradientImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return gradientImage
    }
}
#endif
