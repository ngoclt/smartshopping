//
//  UserViewModel.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/17/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

class UserViewModel {
    
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
}
