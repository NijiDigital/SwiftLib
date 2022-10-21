//
//  UIDevice+Extension.swift
//  PersoLips
//
//  Created by Satish Chauhan on 22/01/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
//

import UIKit

public extension UIDevice {
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneXR
        case iPhoneX
        case iphone12
        case ipad_10_9_inch
        case ipad_10_5_inch
        case ipad_10_2_inch
        case ipad_9_7_inch
        case Unknown
    }

    var hasNotch: Bool {
        let bottom = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0
        let top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
        return (bottom > 0) || (top > 0)
    }

    static var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier.replacingOccurrences(of: ",", with: ".") + String(UnicodeScalar(UInt8(value)))
        }
        return identifier
    }

    static var width: CGFloat {
        UIScreen.main.bounds.width
    }

    static var height: CGFloat {
        UIScreen.main.bounds.height
    }

    var isSmallScreen: Bool {
        [ScreenType.iPhone4, .iPhone5, .iPhone6].contains(screenType)
    }

    var isSmallerThaniPhone12: Bool {
        !([ScreenType.iPhoneXR, .Unknown].contains(screenType))
    }

    var isSmalliPad: Bool {
        [ScreenType.ipad_9_7_inch, .ipad_10_2_inch, .ipad_10_5_inch].contains(screenType)
    }

    private var iPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }

    var screenType: ScreenType {
        guard iPhone else { return .Unknown }
        switch UIDevice.height {
        case 480:
            return .iPhone4
        case 568:
            return .iPhone5
        case 667:
            return .iPhone6
        case 736:
            return .iPhone6Plus
        case 812:
            return .iPhoneX
        case 814:
            return .iphone12
        case 896:
            return .iPhoneXR
        case 1180:
            return .ipad_10_9_inch
        case 1112:
            return .ipad_10_5_inch
        case 1080:
            return .ipad_10_2_inch
        case 1024:
            return .ipad_9_7_inch
        default:
            return .Unknown
        }
    }
}
