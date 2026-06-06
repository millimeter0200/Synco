//
//  DateFormatterHelper.swift
//  Synco
//
//  Created by Mae Maricar R. Yap on 6/6/26.
//

import Foundation

struct DateFormatterHelper {

    static func format(_ date: Date) -> String {

        let calendar = Calendar.current

        let time = date.formatted(
            date: .omitted,
            time: .shortened
        )

        if calendar.isDateInToday(date) {
            return "Today • \(time)"
        }

        if calendar.isDateInYesterday(date) {
            return "Yesterday • \(time)"
        }

        let day = date.formatted(
            .dateTime
                .month(.abbreviated)
                .day()
        )

        return "\(day) • \(time)"
    }
}
