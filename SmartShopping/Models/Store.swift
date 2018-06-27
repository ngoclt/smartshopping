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
    
    private var objectId: String
    private var name: String
    private var address: String
    private var imageCover: String
    
    init() {
        self.objectId = ""
        self.name = ""
        self.address = ""
        self.imageCover = ""
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        name <- map["name"]
        address <- map["address"]
        imageCover <- map["cover"]
    }
}
