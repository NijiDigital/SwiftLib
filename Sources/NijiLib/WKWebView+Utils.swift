//
//  WKWebView+Utils.swift
//  Global
//
//  Created by Nicolas RENAUD on 30/08/2022.
//

#if !os(macOS)
import Foundation
import WebKit

/// Utility extension for `WKWebView`.
public extension WKWebView {
    /// Get a WKWebView with media configuration
    ///
    /// - Parameter frame: The WKWebView initial frame.
    /// - Returns: The configured WKWebView
    static func mediaWebView(frame: CGRect) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.mediaTypesRequiringUserActionForPlayback = []
        configuration.allowsInlineMediaPlayback = true
        configuration.preferences.javaScriptEnabled = true
        configuration.preferences.javaScriptCanOpenWindowsAutomatically = true
        let webView = WKWebView(frame: frame, configuration: configuration)
        webView.isOpaque = false
        webView.backgroundColor = .clear
        webView.scrollView.backgroundColor = .clear
        webView.scrollView.scrollsToTop = false
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.translatesAutoresizingMaskIntoConstraints = false
        webView.scrollView.pinchGestureRecognizer?.isEnabled = false
        return webView
    }
}
#endif
