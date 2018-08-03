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
    
    var objectId: Int64
    var name: String
    var description: String
    var brand: String
    var price: String
    var quantity: Int
    var image: String
    var thumbnail: String
    var isLiked: Bool
    
    init() {
        self.objectId = 0
        self.name = ""
        self.description = ""
        self.image = ""
        self.thumbnail = ""
        self.brand = ""
        self.price = ""
        self.quantity = 0
        self.isLiked = false
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
        brand <- map["brand"]
        price <- map["price"]
        quantity <- map["quantity"]
        isLiked <- map["is_liked"]
    }
}

extension Product: Likable {
    func imageThumbnail() -> String {
        return thumbnail
    }
    
    func title() -> String {
        return name
    }
    
    func status() -> Bool {
        return isLiked
    }
    
    func like() {
        isLiked = true
    }
    
    func unlike() {
        isLiked = false
    }
}


