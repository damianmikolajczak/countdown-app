//
//  LocalNotificationMenager.swift
//  Countdown counter
//
//  Created by Damian Mikołajczak on 15/05/2021.
//

import Foundation
import UIKit
import UserNotifications

struct LocalNotificationManager {
    static func createNotification(for event: Event) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .alert], completionHandler: { granted, error in
            if granted == true && error == nil {
                
            }
        })
        
        let content = UNMutableNotificationContent()
        content.title = "Something is near the corner."
        content.body = "You have an upcoming event called \(event.name) in \(event.tag)!"
        
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: event.notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: {error in
            
        })
    }
}
