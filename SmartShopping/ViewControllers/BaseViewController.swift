//
//  BaseViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBarStyle()
    }
    
    private func setupNavigationBarStyle() {
        navigationController?.navigationBar.setBackgroundImage(UIImage.image(from: .white), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage.image(from: .lightGray)
        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        }
    }
}

