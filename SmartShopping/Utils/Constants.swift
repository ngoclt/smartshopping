//
//  Constants.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/19/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

struct AppConstants {
    static let kUnExpectedErrorMessage = "Unexpected error."
}

struct AppError {
    static let kAppDomain = "life.coder.SSApp"
    static let kAppErrorCode = 0
    
    static let login = NSError(domain: kAppDomain,
                                    code: kAppErrorCode,
                                    userInfo:[NSLocalizedDescriptionKey: "Please input correct login information."])
    static let unexpected = NSError(domain: kAppDomain,
                                    code: kAppErrorCode,
                                    userInfo:[NSLocalizedDescriptionKey: AppConstants.kUnExpectedErrorMessage])
    static func serverError(_ message: String) -> NSError {
        return NSError(domain: kAppDomain,
                       code: kAppErrorCode,
                       userInfo:[NSLocalizedDescriptionKey: message])
    }

}
