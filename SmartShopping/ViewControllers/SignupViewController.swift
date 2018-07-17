//
//  SignupViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/17/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class SignupViewController: BaseViewController {
    
    @IBOutlet fileprivate var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enableHideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        registerKeyboardEventNotification()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unregisterKeyboardEventNotification()
    }
    
    private func registerKeyboardEventNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasHidden), name: .UIKeyboardWillChangeFrame, object: nil)
    }
    
    private func unregisterKeyboardEventNotification() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }

    @objc func keyboardWasShown(notification: Notification) {
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset = scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWasHidden(notification: Notification) {
        scrollView.contentInset = .zero
    }

    
    @IBAction fileprivate func didTapBTNClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
