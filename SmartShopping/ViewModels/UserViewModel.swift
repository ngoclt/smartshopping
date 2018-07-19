//
//  UserViewModel.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/17/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

class UserViewModel {
    
    static var currentUser: Shopper?
    
    init() {
        
    }
    
    func login(username: String, password: String, callback: @escaping (String?, NSError?) -> Void) {
        let params = ["username": username, "password": password]
        let endpoint = Endpoint(path: APIPath.login, method: .post, params: params)
        let call = APICall(endpoint)
        call.requestJSON { result, error in
            guard let token = result?["key"] as? String else {
                callback(nil, error)
                return
            }
            callback(token, error)
        }
    }
    
    func fetchLoggedInShopper(callback: @escaping (Shopper?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.me, method: .get)
        let call = APICall(endpoint)
        call.requestObject(type: Shopper.self) { result, error in
            UserViewModel.currentUser = result
            callback(result, error)
        }
    }
    
    func fetchInterests(callback: @escaping (ResponseList<Interest>?, NSError?) -> Void) {
        let endpoint = Endpoint(path: APIPath.interestPath, method: .get)
        let call = APICall(endpoint)
        call.requestObject(type: ResponseList<Interest>.self) { (result, error) in
            callback(result, error)
        }
    }
}
