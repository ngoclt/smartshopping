//
// Please report any problems with this app template to contact@estimote.com
//

import UIKit
import UserNotifications

extension NotificationManager {
    fileprivate struct Parameters {
        
        /// Desired distance from a beacon from which enter/exit events should be triggered, in meters.
        static let desiredZoneRadius = 2.0
    }
}

class NotificationManager: NSObject {
    
    internal func enableNotifications(deviceIdentifier: String) {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
            guard error == nil else {
                //Display Error.. Handle Error.. etc..
                return
            }
            
            if granted {
                //Register for RemoteNotifications. Your Remote Notifications can display alerts now :)
                UIApplication.shared.registerForRemoteNotifications()
            } else {
                //Handle user denying permissions..
            }
        }
        
        //Register for remote notifications.. If permission above is NOT granted, all notifications are delivered silently to AppDelegate.
        UIApplication.shared.registerForRemoteNotifications()
    }
    
    fileprivate func presentNotification(message: String?) {
        guard let body = message else {
            return
        }
        
        let content = UNMutableNotificationContent()
        content.title = "Smart Shopping"
        content.body = body
        content.sound = UNNotificationSound.default()
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 300, repeats: false)
        
        let identifier = "SSLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if (error != nil) {
                print(error!)
            } else {
                print("Success! ID:\(identifier), Message:\(body), Time:\(trigger.timeInterval.magnitude) seconds")
            }
        }
    }
}
