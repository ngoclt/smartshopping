//
//  TabBarController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
}

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        guard let index = viewControllers?.index(of: viewController) else {
            return false
        }
        
        if index == 3 && APICall.currentUser == nil {
            performSegue(withIdentifier: "OpenLogin", sender: self)
            return false
        }
        
        return true
    }
}
