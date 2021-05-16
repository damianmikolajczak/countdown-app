//
//  EventTag.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 13/05/2021.
//

import Foundation
import UIKit

struct EventTag: CustomStringConvertible {
    
    public var tag: TagName
 
    var description: String {
        switch tag {
        case .oneWeek:
            return "one week"
        case .oneDay:
            return "one day"
        case .oneHour:
            return "one hour"
        case .thirtyMinutes:
            return "thirty minutes"
        case .fiveMinutes:
            return "five minutes"
        }
    }
    
    enum TagName {
        case oneWeek
        case oneDay
        case oneHour
        case thirtyMinutes
        case fiveMinutes
    }
    
    
    
    public var tagColor: UIColor {
        switch tag {
        case .oneWeek:
            return UIColor(red: 0, green: 0.8, blue: 0.278, alpha: 1)
        case .oneDay:
            return UIColor(red: 0, green: 0.471, blue: 1, alpha: 1)
        case .oneHour:
            return UIColor(red: 1, green: 0.796, blue: 0, alpha: 1)
        case .thirtyMinutes:
            return UIColor(red: 1, green: 0.565, blue: 0, alpha: 1)
        case .fiveMinutes:
            return UIColor(red: 1, green: 0.055, blue: 0.094, alpha: 1)
        }
    }
    
    public var tagName: String {
        switch tag {
        case .oneWeek:
            return "One week before event"
        case .oneDay:
            return "One day before event"
        case .oneHour:
            return "One hour before event"
        case .thirtyMinutes:
            return "Thirty minutes before event"
        case .fiveMinutes:
            return "Five minutes before event"
        }
    }
    
}
