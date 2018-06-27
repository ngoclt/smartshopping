//
//  ResponseList.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import ObjectMapper

struct ResponseList<T: Mappable>: Mappable {
    
   var count: Int
   var next: String?
   var previous: String?
   var results: [T]?
    
    init?(map: Map) {
        count = 0
    }
    
    mutating func mapping(map: Map) {
        count <- map["count"]
        next <- map["next"]
        previous <- map["previous"]
        results <- map["results"]
    }
}
