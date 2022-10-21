//
//  UITableView+Utils.swift
//

#if !os(macOS)
import UIKit

/// Utility extension for `UITableView`.
public extension UITableView {
    /// Scroll on top of the UITableView with an animation.
    ///
    /// - Parameter completion: The block called at the end of the animation
    func scrollOnTopAnimated(completion: @escaping () -> Void) {
        scrollToOffsetAnimated(0, completion: completion)
    }
    
    /// Scroll to the desired offset of the UITableView with an animation.
    ///
    /// - Parameters:
    ///   - offset: The offset to reach
    ///   - completion: The block called at the end of the animation
    func scrollToOffsetAnimated(_ offset: CGFloat, completion: @escaping () -> Void) {
        let finalOffset = CGPoint(x: 0, y: offset - safeAreaInsets.top)
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.setContentOffset(finalOffset, animated: false)
        } completion: { finished in
            if finished {
                completion()
            }
        }
    }
    
    /// Scroll on top of the UITableView with an animation.
    ///
    func refreshTableFooterHeight() {
        if let footer = tableFooterView {
            let newSize = footer.systemLayoutSizeFitting(CGSize(width: bounds.width, height: 0))
            footer.frame.size.height = newSize.height
        }
    }

    func isValid(indexPath: IndexPath) -> Bool {
        indexPath.section < numberOfSections && indexPath.row < numberOfRows(inSection: indexPath.section)
    }
}
#endif
