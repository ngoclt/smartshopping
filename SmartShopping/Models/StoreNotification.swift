//
//  StoreNotification.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

class StoreNotification: Mappable {
    
    var objectId: String
    var title: String
    var message: String
    var beacons: [Beacon]
    var product: Product?
    var category: Category?
    var store: Store?
    var startedAt: Date?
    var expiredAt: Date?
    
    var thumb: String? {
        get {
            if let _ = product {
                return product?.image
            } else if let _ = category {
                return category?.thumbnail
            }
            return store?.imageCover
        }
    }
    
    init() {
        self.objectId = ""
        self.title = ""
        self.message = ""
        self.beacons = []
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        title <- map["title"]
        message <- map["message"]
        beacons <- map["beacons"]
        product <- map["product"]
        category <- map["category"]
        store <- map["store"]
        startedAt <- map["started_at"]
        expiredAt <- map["expired_at"]
    }
}
