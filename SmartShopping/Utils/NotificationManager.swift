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
    
    fileprivate lazy var monitoringManager: ESTMonitoringV2Manager = ESTMonitoringV2Manager(desiredMeanTriggerDistance: Parameters.desiredZoneRadius, delegate: self)
    
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
        
        self.monitoringManager.startMonitoring(forIdentifiers: [deviceIdentifier])
    }
    
    fileprivate func presentNotification(message: String) {
        let notification = UILocalNotification()
        notification.alertBody = message
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.presentLocalNotificationNow(notification)
    }
    
    fileprivate func name(_ state: ESTMonitoringState) -> String {
        switch state {
        case .unknown: return "Unknown"
        case .insideZone: return "Inside"
        case .outsideZone: return "Outside"
        }
    }
}

extension NotificationManager: ESTMonitoringV2ManagerDelegate {
    
    func monitoringManagerDidStart(_ manager: ESTMonitoringV2Manager) {
        print("Monitoring started successfully.")
    }
    
    func monitoringManager(_ manager: ESTMonitoringV2Manager, didFailWithError error: Error) {
        print("Monitoring failed: \(error.localizedDescription)")
    }
    
    func monitoringManager(_ manager: ESTMonitoringV2Manager, didDetermineInitialState state: ESTMonitoringState, forBeaconWithIdentifier identifier: String) {
        print("Determined initial state: for \(identifier) - \(self.name(state)).")
    }
    
    func monitoringManager(_ manager: ESTMonitoringV2Manager, didEnterDesiredRangeOfBeaconWithIdentifier identifier: String) {
        print("Entered range of \(identifier).")
        self.presentNotification(message: self.enterMessage!)
    }
    
    func monitoringManager(_ manager: ESTMonitoringV2Manager, didExitDesiredRangeOfBeaconWithIdentifier identifier: String) {
        print("Exited range of \(identifier).")
        self.presentNotification(message: self.exitMessage!)
    }
}
