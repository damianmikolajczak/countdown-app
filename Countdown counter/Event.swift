//
//  MyEvent.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 12/05/2021.
//

import Foundation

class Event {
    var name: String
    var date: Date
    var tag: EventTag
    var description: String?
    var expired: Bool {
        return date.timeIntervalSinceNow <= 0
    }
    var notificationDate: Date {
        switch tag.tag {
        case .oneWeek:
            return date.addingTimeInterval(-7*24*60*60)
        case .oneDay:
            return date.addingTimeInterval(-24*60*60)
        case .oneHour:
            return date.addingTimeInterval(-60*60)
        case .thirtyMinutes:
            return date.addingTimeInterval(-30*60)
        case .fiveMinutes:
            return date.addingTimeInterval(-5*60)
        }
    }
    
    init(name: String, date: Date, tag: EventTag, description: String?) {
        self.name = name
        self.date = date
        self.tag = tag
        self.description = description
    }
}
