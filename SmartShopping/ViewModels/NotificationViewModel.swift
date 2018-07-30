//
//  NotificationViewModel.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

class NotificationViewModel {
    
    init() {
        
    }
    
    func fetchUserNotifications(_ callback: @escaping (ResponseList<StoreNotification>?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.notifications, method: .get)
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<StoreNotification>.self) { (result, error) in
            callback(result, error)
        }
    }
    
    func fetchNearbyNotification() {
        
    }
    
    func fetchNotificationByBeacon(_ beaconId: String) {
        
    }
}
