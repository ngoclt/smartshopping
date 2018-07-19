//
//  Interest.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/19/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

class Interest: Mappable {
    var objectId: Int64
    var product: Product?
    var category: Category?
    
    init() {
        self.objectId = 0
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        product <- map["product"]
        category <- map["category"]
    }
}
