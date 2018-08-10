//
//  BaseViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import FTIndicator

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

extension BaseViewController {
    func enableHideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(BaseViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension BaseViewController {
    func showProgress(message: String) {
        FTIndicator.showProgress(withMessage: message, userInteractionEnable: true)
    }
    
    func dismissProgress() {
        FTIndicator.dismissProgress()
    }
    
    func showErrorToast(_ error: NSError?) {
        let message = error?.localizedDescription ?? AppError.unexpected.localizedDescription
        FTIndicator.showError(withMessage: message)
    }
    
    func showNotification(title: String, message: String) {
        FTIndicator.showNotification(withTitle: title, message: message)
    }
    
    func dismissNotification() {
        FTIndicator.dismissNotification()
    }
}
