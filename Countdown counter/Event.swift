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
    
    init(name: String, date: Date, tag: EventTag, description: String?) {
        self.name = name
        self.date = date
        self.tag = tag
        self.description = description
    }
}
