//
//  OnboardingViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/19/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class OnboardingViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if APISession.loadCache() {
            
        }
        
        openApplication()
    }
    
    func openApplication() {
       performSegue(withIdentifier: "OpenApplication", sender: self)
    }
}
