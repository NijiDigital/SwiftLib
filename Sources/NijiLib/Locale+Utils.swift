//
//  Locale+Extension.swift
//  PersoLips
//
//  Created by Himalaya Rajput on 29/04/21.
//  Copyright © 2021 L'Oréal. All rights reserved.
//

import Foundation

public extension Locale {
  static var isChineseSimplified: Bool {
    Bundle.main.preferredLocalizations[0].lowercased() == "zh-hans"
  }

  static var isChineseHongKong: Bool {
    Bundle.main.preferredLocalizations[0].lowercased() == "zh-hk"
  }

  static var isChineseTaiwan: Bool {
    Bundle.main.preferredLocalizations[0].lowercased() == "zh-tw"
  }

  static var isFrench: Bool {
    current.languageCode?.lowercased() == "fr"
  }

  static var isKorean: Bool {
    current.languageCode?.lowercased() == "ko"
  }

  static var isJapanese: Bool {
    current.languageCode?.lowercased() == "ja"
  }

  static var isEnglish: Bool {
    current.languageCode?.lowercased() == "en"
  }

  static var isArabic: Bool {
    current.languageCode?.lowercased() == "ar"
  }

  static var isThai: Bool {
    current.languageCode?.lowercased() == "th"
  }

  static var isChinese: Bool {
    current.languageCode?.lowercased() == "zh"
  }
}
