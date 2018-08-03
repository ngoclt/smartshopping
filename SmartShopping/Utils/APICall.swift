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
    static let login = "rest-auth/login/"
    static let logout = "rest-auth/logout"
    static let me = "shoppers/me/"
    static let stores = "stores/"
    static let products = "products/"
    static let interests = "interests/"
    static let notifications = "notifications/"
    
    static func storeProduct(id: Int64) -> String {
        return "stores/\(id)/products/"
    }
    
    static func storeCategories(id: Int64) -> String {
        return "stores/\(id)/categories/"
    }
}

struct Endpoint {
    
    static let baseUrl = "http://programmer.life:8000/api/v1/"
    
    var url: String
    var method: HTTPMethod
    var params: [String: Any]?
    var encoding: ParameterEncoding = JSONEncoding.default
    
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

class APISession {
    
    static var current: APISession? {
        didSet {
            if let session = current {
                UserDefaults.standard.set(session.token, forKey: "SessionID")
            } else {
                UserDefaults.standard.removeObject(forKey: "SessionID")
            }
        }
    }
    
    var token: String
    
    init(token: String) {
        self.token = token
    }
    
    static func loadCache() -> Bool {
        if let cached = UserDefaults.standard.string(forKey: "SessionID") {
            current = APISession(token: cached)
            return true
        }
        
        return false
    }
}

class APICall {
    
    private var request: DataRequest
    
    init(_ endpoint: Endpoint) {
        var header: [String: String]? = nil
        if let userSession = APISession.current {
            header = ["Authorization": "Token \(userSession.token)"]
        }
        
        request = Alamofire.request(endpoint.url,
                                    method: endpoint.method,
                                    parameters: endpoint.params,
                                    encoding: endpoint.encoding,
                                    headers: header).validate()
    }
    
    private func parseError(_ bodyData: Data?, defaultValue: NSError?) -> NSError? {
        var parsedError = defaultValue
        
        if let data = bodyData {
            do {
                let jsonDecoder = JSONDecoder()
                let errorResponse = try jsonDecoder.decode([String: String].self, from: data)
                if let detail = errorResponse["detail"] {
                    parsedError = AppError.serverError(detail)
                }
            } catch {
                
            }
        }
        
        return parsedError
    }

    func requestObject<T: Mappable>(type: T.Type,
                                    completion: ((T?, NSError?) -> Void)? = nil) {
        request.responseObject { (response: DataResponse<T>) in
            switch response.result {
            case .success:
                completion?(response.result.value, nil)
                break
            case .failure(let error):
                let displayError = self.parseError(response.data, defaultValue: error as NSError)
                completion?(nil, displayError)
                break
            }
        }
    }

    func requestArray<T: Mappable>(type: T.Type,
                                   completion: (([T]?, NSError?) -> Void)? = nil) {
        request.responseArray { (response: DataResponse<[T]>) in
            
            switch response.result {
            case .success:
                completion?(response.result.value, nil)
                break
            case .failure(let error):
                let displayError = self.parseError(response.data, defaultValue: error as NSError)
                completion?(nil, displayError)
                break
            }
        }
    }

    func requestJSON(completion: (([String: Any]?, NSError?) -> Void)? = nil) {
        request.responseJSON { response in
            switch response.result {
            case .success:
                guard let result = response.result.value as? [String : Any] else {
                    completion?(nil, AppError.unexpected)
                    break
                }
                
                completion?(result, nil)
                break
            case .failure(let error):
                let displayError = self.parseError(response.data, defaultValue: error as NSError)
                completion?(nil, displayError)
                break
            }
        }
    }

    func requestData(completion: ((Data?, NSError?) -> Void)? = nil) {
        request.response { response in
            completion?(response.data, response.error as NSError?)
        }
    }
}
