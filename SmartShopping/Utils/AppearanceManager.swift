//
//  AppearanceManager.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/27/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

public class AppearanceManager {
    
    public class func configureNavigationBar() {
        UINavigationBar.appearance().barStyle = .default
        UINavigationBar.appearance().barTintColor = .white
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.black,
                                                            NSAttributedStringKey.font: FontBook.robotoMedium.of(size: 18)]
    }
    
    public class func configureTabBar() {
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
}

