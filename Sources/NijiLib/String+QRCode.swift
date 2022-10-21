//
//  String+QRCode.swift
//

#if !os(macOS)
    import CoreImage.CIFilterBuiltins
    import Foundation
    import UIKit

    public extension String {
        var asQRCodeImage: UIImage {
            let context = CIContext()
            let data = data(using: .utf8)
            let filter = CIFilter.qrCodeGenerator()
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue("H", forKey: "inputCorrectionLevel")

            let transform = CGAffineTransform(scaleX: 8, y: 8)
            guard let outputImage = filter.outputImage?.transformed(by: transform) else {
                return UIImage()
            }

            let maskFilter = CIFilter.blendWithMask()
            maskFilter.maskImage = outputImage.applyingFilter("CIColorInvert")
            maskFilter.inputImage = CIImage(color: .white)
            guard let image = maskFilter.outputImage,
                  let qrImage = context.createCGImage(image, from: image.extent).map(UIImage.init) else {
                return UIImage()
            }
            return qrImage
        }
    }
#endif
