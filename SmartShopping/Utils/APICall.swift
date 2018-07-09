//
//  APICall.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper
import ObjectMapper

struct APIPath {
    static let storePath = "stores/"
    static let productPath = "products/"
    
    static func storeProductPath(id: Int64) -> String {
        return "stores/\(id)/products/"
    }
}

struct Endpoint {
    
    static let baseUrl = "http://0.0.0.0:8000/api/v1/"
    
    var url: String
    var method: HTTPMethod
    var params: [String: Any]?
    var encoding: ParameterEncoding
    
    
    init(path: String,
         method: HTTPMethod,
         params: [String: Any]? = nil,
         encoding: ParameterEncoding? = nil) {
        
        self.url = Endpoint.baseUrl + path
        self.method = method
        self.params = params
        
        if let _ = encoding {
            self.encoding = encoding!
            return
        }
        
        if self.method == .get {
            self.encoding = URLEncoding.default
        } else {
            self.encoding = JSONEncoding.default
        }
    }
}

class APICall {
    
    private var request: DataRequest
    
    init(_ endpoint: Endpoint) {
        request = Alamofire.request(endpoint.url,
                                    method: endpoint.method,
                                    parameters: endpoint.params,
                                    encoding: endpoint.encoding).validate()
    }

    func requestObject<T: Mappable>(type: T.Type,
                                    completion: ((T?, NSError?) -> Void)? = nil) {
        request.responseObject { (response: DataResponse<T>) in
            completion?(response.result.value, response.result.error as NSError?)
        }
    }

    func requestArray<T: Mappable>(type: T.Type,
                                   completion: (([T]?, NSError?) -> Void)? = nil) {
        request.responseArray { (response: DataResponse<[T]>) in
            completion?(response.result.value, response.result.error as NSError?)
        }
    }

    func requestJSON(completion: ((Any?, NSError?) -> Void)? = nil) {
        request.responseJSON { response in
            completion?(response.result.value, response.result.error as NSError?)
        }
    }

    func requestData(completion: ((Data?, NSError?) -> Void)? = nil) {
        request.response { response in
            completion?(response.data, response.error as NSError?)
        }
    }
}
