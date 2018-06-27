//
//  ProductViewModel.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

class ProductViewModel {
    
    init() {
        
    }
    
    func fetchList(_ callback: @escaping (ResponseList<Product>?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.productPath, method: .get)
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<Product>.self) { result, error in
            callback(result, error)
        }
    }
    
    func fetchDetail(_ callback: @escaping (Product?, NSError?) -> Void) {
        
    }
}
