//
//  Product.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

class Product: Mappable {
    
    private var objectId: String
    private var name: String
    private var description: String
    private var image: String
    private var thumbnail: String
    
    init() {
        self.objectId = ""
        self.name = ""
        self.description = ""
        self.image = ""
        self.thumbnail = ""
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        name <- map["name"]
        description <- map["description"]
        image <- map["image"]
        thumbnail <- map["thumbnail"]
    }
}
