//
//  Extensions.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/26/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import Foundation

extension Data {
    func hexString() -> String {
        return self.reduce("") { string, byte in
            string + String(format: "%02X", byte)
        }
    }
}
