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

        var visibleViewController: UIViewController? {
            guard let rootViewController = keyWindow?.rootViewController else {
                return nil
            }
            return getVisibleViewController(rootViewController)
        }
    }

    private extension UIApplication {
        func getVisibleViewController(_ rootViewController: UIViewController) -> UIViewController? {
            if let presentedViewController = rootViewController.presentedViewController {
                return getVisibleViewController(presentedViewController)
            }
            if let navigationController = rootViewController as? UINavigationController,
               let visibleViewController = navigationController.visibleViewController {
                return getVisibleViewController(visibleViewController)
            }
            if let tabBarController = rootViewController as? UITabBarController,
               let selectedViewController = tabBarController.selectedViewController {
                return getVisibleViewController(selectedViewController)
            }
            if let firstChildrenViewController = rootViewController.children.first {
                return getVisibleViewController(firstChildrenViewController)
            }
            return rootViewController
        }
    }
#endif
