//
//  UIViewController+Extension.swift
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

        /// Method rotates the UIImage by degrees provided and flips if required
        func imageRotatedByDegrees(_ degrees: CGFloat, flip: Bool) -> UIImage {
            let degreesToRadians: (CGFloat) -> CGFloat = { _ in
                degrees / 180.0 * CGFloat(Double.pi)
            }

            // calculate the size of the rotated view's containing box for our drawing space
            let rotatedViewBox = UIView(frame: CGRect(origin: CGPoint.zero, size: size))
            let t = CGAffineTransform(rotationAngle: degreesToRadians(degrees))
            rotatedViewBox.transform = t
            let rotatedSize = rotatedViewBox.frame.size

            // Create the bitmap context
            UIGraphicsBeginImageContext(rotatedSize)
            let bitmap = UIGraphicsGetCurrentContext()

            // Move the origin to the middle of the image so we will rotate and scale around the center.
            bitmap?.translateBy(x: rotatedSize.width / 2.0, y: rotatedSize.height / 2.0)

            //   // Rotate the image context
            bitmap?.rotate(by: degreesToRadians(degrees))

            // Now, draw the rotated/scaled image into the context
            var yFlip: CGFloat

            if flip {
                yFlip = CGFloat(-1.0)
            } else {
                yFlip = CGFloat(1.0)
            }

            bitmap?.scaleBy(x: yFlip, y: -1.0)
            if let cgImage = cgImage {
                bitmap?.draw(cgImage, in: CGRect(x: -size.width / 2,
                                                 y: -size.height / 2,
                                                 width: size.width,
                                                 height: size.height))
            }

            let newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()

            return newImage ?? UIImage()
        }

        func imageResize(_ sizeChange: CGSize) -> UIImage? {
            let hasAlpha = true
            let scale: CGFloat = 0.0 // Use scale factor of main screen

            UIGraphicsBeginImageContextWithOptions(sizeChange, !hasAlpha, scale)
            draw(in: CGRect(origin: CGPoint.zero, size: sizeChange))

            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            return scaledImage
        }
    }
#endif
