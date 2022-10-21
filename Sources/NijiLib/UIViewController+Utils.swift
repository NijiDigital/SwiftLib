//
//  UIViewController+Utils.swift
//

#if !os(macOS)
    import UIKit

    /// Utility extension for `UIViewController`.
    public extension UIViewController {
        /// Returns the controller the most on top of the view stack.
        var topController: UIViewController {
            if let presentedViewController = presentedViewController {
                return presentedViewController.topController
            }
            if let navigationController = self as? UINavigationController {
                if let topViewController = navigationController.topViewController {
                    return topViewController.topController
                }
                return navigationController
            }
            if let tabBarController = self as? UITabBarController {
                if let selectedViewController = tabBarController.selectedViewController {
                    return selectedViewController.topController
                }
                return tabBarController
            }
            return self
        }
    }
#endif
