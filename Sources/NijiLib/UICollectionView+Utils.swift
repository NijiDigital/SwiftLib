//
//  UICollectionView+Utils.swift
//

import Foundation

public extension UICollectionView {
    func isValid(indexPath: IndexPath) -> Bool {
        indexPath.section < numberOfSections && indexPath.row < numberOfItems(inSection: indexPath.section)
    }

    func validIndexPaths(_ indexPaths: [IndexPath]) -> [IndexPath] {
        indexPaths.filter { $0.row < numberOfItems(inSection: $0.section) }
    }
}
