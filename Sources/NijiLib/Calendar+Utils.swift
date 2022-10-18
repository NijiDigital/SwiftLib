//
//  Calendar+Utils.swift
//  Global
//
//  Created by Nicolas RENAUD on 05/06/2022.
//

import Foundation

/// Utility extension for `Calendar`.
public extension Calendar {
    static var UTC: Calendar {
        var utcCalendar = Calendar(identifier: .gregorian)
        utcCalendar.timeZone = TimeZone(abbreviation: "UTC")!
        return utcCalendar
    }
    
    /// Get the short weekday symbols depending the given first weekday.
    var shortWeekdaySymbolsWithFirstWeekday: [String] {
        shortWeekdaySymbols.shift(withDistance: firstWeekday - 1)
    }

    /// Get the days of the week depending the given date.
    @available(OSX 10.12, *)
    func weekDays(for date: Date) -> [Date] {
        guard let interval = dateInterval(of: .weekOfYear, for: date) else {
            return []
        }
        let days = (0...6).compactMap {
            self.date(byAdding: .day, value: $0, to: interval.start)
        }
        return days
    }
    
    func isDate(_ date1: Date, inSameYearAs date2: Date) -> Bool {
        component(.year, from: date1) == component(.year, from: date2)
    }
}

private extension Calendar {
    func isFridayOrSaturday(date: Date) -> Bool {
        let weekday = component(.weekday, from: date)
        return weekday == 6 || weekday == 7
    }

    func isNewYearEve(date: Date) -> Bool {
        let day = component(.day, from: date)
        let month = component(.month, from: date)
        return day == 31 && month == 12
    }
}
