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

    var objectId: String
    var name: String
    var beaconId: String
    
    init() {
        self.objectId = ""
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
    }
}
