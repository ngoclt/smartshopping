//
//  Beacon.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/30/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

class Beacon: Mappable {

    var objectId: Int64
    var name: String
    var beaconId: String
    
    var store: Store?
    var notifications: [StoreNotification]?
    
    init() {
        self.objectId = 0
        self.name = ""
        self.beaconId = ""
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        name <- map["name"]
        beaconId <- map["beacon_id"]
        
        store <- map["store"]
        notifications <- map["notifications"]
    }
}
