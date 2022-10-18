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
    
    /// Get the opening schedule for the given date.
    func openingSchedule(for date: Date) -> Date {
        var components = dateComponents([.year, .month, .day], from: date)
        components.hour = 9
        components.minute = 0
        components.second = 0
        return self.date(from: components) ?? date
    }
    
    /// Get the closing schedule for the given date.
    func closingSchedule(for date: Date) -> Date {
        var components = dateComponents([.year, .month, .day], from: date)
        if isNewYearEve(date: date) {
            components.hour = 5
        } else if isFridayOrSaturday(date: date) || isSpecialDate(date: date) {
            components.hour = 4
        } else {
            components.hour = 3
        }
        components.minute = 0
        components.second = 0
        let closing = self.date(from: components) ?? date
        return self.date(byAdding: .day, value: 1, to: closing) ?? date
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
    
    // For now we have this list of special dates of every years.
    // Should be removed after MVP when the API will be in place.
    func isSpecialDate(date: Date) -> Bool {
        let day = component(.day, from: date)
        let month = component(.month, from: date)
        return day == 17 && month == 4
            || day == 30 && month == 4
            || day == 7 && month == 5
            || day == 25 && month == 5
            || day == 5 && month == 6
            || day == 13 && month == 7
            || day == 14 && month == 8
            || day == 31 && month == 10
            || day == 10 && month == 11
            || day == 24 && month == 12
    }
}
