//
//  ProcessInfo+Utils.swift
//  Global
//
//  Created by Mathieu VIEL on 28/09/2022.
//

import Foundation

public extension ProcessInfo {
    static var isRunningTests: Bool {
        ProcessInfo.processInfo.environment["TEST"] != nil
    }
}
