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
        let endpoint = Endpoint(path: APIPath.storePath, method: .get)
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<Store>.self) { result, error in
            callback(result, error)
        }
    }
    
    func fetchDetail(_ callback: @escaping (Store?, NSError?) -> Void) {
        
    }
    
    func fetchProduct(_ callback: @escaping (ResponseList<Product>?, NSError?) -> Void) {
        
    }
}
