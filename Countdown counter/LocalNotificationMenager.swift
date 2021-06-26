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
    // This function creates a notification request at a specific time which depends on the events tag. First we get the current notification center.
    static func createNotification(for event: Event) {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .alert], completionHandler: { granted, error in
            if granted == true && error == nil {
                
            }
        })
        
        // The next step is to create a mutable content with a title and a body that shows the event tame and the time that is left.
        let content = UNMutableNotificationContent()
        content.title = "Something is near the corner."
        content.body = "You have an upcoming event called \(event.name) in \(event.tag)!" //the event.tag is a calculated property that returns a string with the time that is left.
        
        // The notification triggers on a specific date which is calculated in the event itself.
        // Because we need the exact date we have to get the year, month, day, hour, minute and second component from the notification date.
        // The alst thing to do is to add to the center a request with the created trigger and content.
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: event.notificationDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: {error in
            
        })
    }
}
