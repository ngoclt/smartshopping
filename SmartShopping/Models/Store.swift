//
//  Store.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

class Store: Mappable {
    
    var objectId: String
    var name: String
    var address: String
    var imageCover: String
    var liked: Bool
    
    init() {
        objectId = ""
        name = ""
        address = ""
        imageCover = ""
        liked = false
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        name <- map["name"]
        address <- map["address"]
        imageCover <- map["cover"]
        liked <- map["liked"]
    }
}
