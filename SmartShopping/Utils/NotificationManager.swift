//
// Please report any problems with this app template to contact@estimote.com
//

import UIKit
import UserNotifications

class NotificationManager: NSObject {
    
    static let shared = NotificationManager()
    
    private override init() {
        super.init()
    }
    
    func enableNotifications() {
        
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            
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
    
    
    
    fileprivate func presentNotification(title: String, message: String) {
        let notificationCenter = UNUserNotificationCenter.current()
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = message
        content.sound = UNNotificationSound.default()
        let request = UNNotificationRequest(identifier: "exit", content: content, trigger: nil)
        notificationCenter.add(request, withCompletionHandler: nil)
    }
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    
    // Needs to be implemented to receive notifications both in foreground and background
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([UNNotificationPresentationOptions.alert, UNNotificationPresentationOptions.sound])
    }
}
