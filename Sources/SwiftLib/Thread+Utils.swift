//
//  Thread+Utils.swift
//

import Foundation

/// Utility extension for `Thread`.
public extension Thread {
    /// Perfom action on current thread if it's main thread.
    /// If not, or dispatch it on the main queue.
    ///
    /// - Parameter block: The block to perform
    static func runOnMain(block: @escaping (() -> Void)) {
        if Thread.isMainThread {
            block()
            return
        }
        DispatchQueue.main.async(execute: block)
    }
}
