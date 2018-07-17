//
//  LoginViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet fileprivate var tfEmail: UnderlineTextField! {
        didSet {
            tfEmail.clearButtonMode = .whileEditing
        }
    }
    @IBOutlet fileprivate var tfPassword: UnderlineTextField! {
        didSet {
            tfPassword.clearButtonMode = .whileEditing
        }
    }
    
    @IBOutlet fileprivate var btnLogin: UIButton!
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
    
    @IBAction fileprivate func didTapBTNLogin(_ sender: UIButton) {
        tfEmail.resignFirstResponder()
        tfPassword.resignFirstResponder()
        
        //TODO: Process for login here
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction fileprivate func didTapBTNClose(_ sender: UIButton) {
        tfEmail.resignFirstResponder()
        tfPassword.resignFirstResponder()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction fileprivate func didTapBTNSignup(_ sender: UIButton) {
        performSegue(withIdentifier: "OpenSignup", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfEmail.resignFirstResponder()
        tfPassword.resignFirstResponder()
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        //TODO: Need to handle displaying the keyboard for small screen.
    }
    
    @objc func keyboardWasHidden(notification: Notification) {
        //TODO: Need to handle displaying the keyboard for small screen.
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == tfEmail {
            tfPassword.becomeFirstResponder()
        }

        return true
    }
}
