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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if APISession.loadCache() {
            let userVM = UserViewModel()
            userVM.fetchLoggedInShopper { (_, _) in
                self.openApplication()
            }
        } else {
            openApplication()
        }
    }
    
    func openApplication() {
       performSegue(withIdentifier: "OpenApplication", sender: self)
    }
}
