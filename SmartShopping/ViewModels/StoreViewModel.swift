//
//  StoreViewModel.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

class StoreViewModel {
    
    init() {
        
    }
    
    func fetchList(_ callback: @escaping (ResponseList<Store>?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.stores, method: .get)
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<Store>.self) { result, error in
            callback(result, error)
        }
    }
    
    func fetchDetail(storeId: String, callback: @escaping (Store?, NSError?) -> Void) {
        
    }
    
    func fetchProduct(storeId: Int64, categoryId: Int64 = 0, callback: @escaping (ResponseList<Product>?, NSError?) -> Void) {
        
        var endpoint = Endpoint(path: APIPath.storeProduct(id: storeId), method: .get)
        if categoryId > 0 {
            endpoint.params = ["category": categoryId]
        }
        
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<Product>.self) { result, error in
            callback(result, error)
        }
    }
    
    func fetchCategory(storeId: Int64, callback: @escaping (ResponseList<Category>?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.storeCategories(id: storeId), method: .get)
        
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<Category>.self) { result, error in
            callback(result, error)
        }
    }
    
    func fetchBeacon(_ beaconId: String, callback: @escaping (Beacon?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.beacon(id: beaconId), method: .get)
        
        let call = APICall(endpoint)
        call.requestObject(type: Beacon.self) { result, error in
            callback(result, error)
        }
    }
}
