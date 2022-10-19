//
//  UIDevice+Utils.swift
//

#if !os(macOS)
import UIKit

public extension UIApplication {
    var hasNotch: Bool {
        (UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0) > 0
    }
    
    var firstKeyWindow: UIWindow? {
        UIApplication.shared.connectedScenes
            .filter { $0.activationState == .foregroundActive }
            .first { $0 is UIWindowScene }
            .flatMap { $0 as? UIWindowScene }?.windows
            .first { $0.isKeyWindow }
            ?? (UIApplication.shared.delegate?.window ?? nil)
    }
}
#endif
