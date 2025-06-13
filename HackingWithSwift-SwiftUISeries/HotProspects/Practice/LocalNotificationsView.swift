//
//  LocalNotificationsView.swift
//  HotProspects
//
//  Created by Sylvan  on 12/06/2025.
//

import SwiftUI
import UserNotifications

struct LocalNotificationsView: View {
    var body: some View {
        VStack {
            Button("request permissions") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
                { success, error in
                    if success {
                        print("permission granted")
                    }
                    if let error {
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }

            Button("schedule notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = .default

                // show 5sec from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    LocalNotificationsView()
}
