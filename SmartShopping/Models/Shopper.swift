//
//  Shopper.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/13/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

class Shopper: Mappable {
    
    var objectId: Int64
    var name: String
    
    init() {
        objectId = 0
        name = ""
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        name <- map["name"]
    }
}
