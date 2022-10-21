//
//  URLRequest+Utils.swift
//

#if !os(macOS)
    import Foundation

    /// Utility extension for `URLRequest`.
    public extension URLRequest {
        /// Set the value of Content-Type HTTPHeaderField.
        ///
        /// - Parameters:
        ///    - contentType: The `ContentType` of  HTTPHeaderField
        mutating func setContentType(_ contentType: ContentType) {
            setValue(contentType.headerValue, forHTTPHeaderField: ContentType.httpHeaderField)
        }

        enum ContentType {
            case json
            case xWWWFormUrlEncoded

            static let httpHeaderField = "Content-Type"

            var headerValue: String {
                switch self {
                case .json:
                    return "application/json"
                case .xWWWFormUrlEncoded:
                    return "application/x-www-form-urlencoded"
                }
            }
        }
    }
#endif
