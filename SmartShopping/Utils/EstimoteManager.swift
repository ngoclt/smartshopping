//
//  EstimoteManager.swift
//  SmartShopping
//
//  Created by Ngoc LE on 8/7/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import EstimoteProximitySDK

struct NearbyBeacon {
    let identifier: String
    let title: String
}

extension Notification.Name {
    
    static let onEnterNewZone = Notification.Name("OnEnterNewZone")
    static let onExitZone = Notification.Name("OnExitZone")
    static let onUpdateNearbyBeacons = Notification.Name("OnUpdateNearbyBeacons")
}

class EstimoteManager {
    static let appID = "le-tuan-ngoc-s-proximity-f-ho2"
    static let appToken = "133f530c6c843cf0c8d4f285493f96ad";
    
    static let shared = EstimoteManager()
    
    var proximityObserver: ProximityObserver!
    var nearbyContent = [NearbyBeacon]()
    
    private init() {
        let estimoteCloudCredentials = CloudCredentials(appID: EstimoteManager.appID, appToken: EstimoteManager.appToken)
        
        proximityObserver = ProximityObserver(credentials: estimoteCloudCredentials, onError: { error in
            print("ProximityObserver error: \(error)")
        })
    }
    
    func startObserving() {
        
        let zone = ProximityZone(tag: "le-tuan-ngoc-s-proximity-f-ho2", range: ProximityRange.near)
        zone.onEnter = { context in
            let beacon = NearbyBeacon(identifier: context.deviceIdentifier, title: context.attachments["smart-shopping-fys/title"]!)
            NotificationCenter.default.post(name: Notification.Name.onEnterNewZone, object: beacon)
        }
        zone.onExit = { context in
            let beacon = NearbyBeacon(identifier: context.deviceIdentifier, title: context.attachments["smart-shopping-fys/title"]!)
            NotificationCenter.default.post(name: Notification.Name.onExitZone, object: beacon)
        }
        zone.onContextChange = { contexts in
            self.nearbyContent = contexts.map {
                return NearbyBeacon(identifier: $0.deviceIdentifier, title: $0.attachments["smart-shopping-fys/title"]!)
            }
            NotificationCenter.default.post(name: Notification.Name.onUpdateNearbyBeacons, object: self.nearbyContent)
        }
        proximityObserver.startObserving([zone])
    }
    
    func stopObserving() {
        proximityObserver.stopObservingZones()
    }
}
