//
//  Likable.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/19/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation

protocol Likable {
    func imageThumbnail() -> String
    func title() -> String
    func status() -> Bool
    
    func like()
    func unlike()
}
