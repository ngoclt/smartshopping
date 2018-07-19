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
    var username: String
    var firstName: String
    var lastName: String
    var email: String
    var avatar: String
    var gender: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init() {
        objectId = 0
        username = ""
        firstName = ""
        lastName = ""
        email = ""
        avatar = ""
        gender = ""
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        objectId <- map["id"]
        username <- map["username"]
        firstName <- map["first_name"]
        lastName <- map["last_name"]
        email <- map["email"]
        avatar <- map["avatar"]
        gender <- map["gender"]
    }
}
