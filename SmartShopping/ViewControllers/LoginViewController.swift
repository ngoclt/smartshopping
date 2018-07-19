//
//  LoginViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet fileprivate var tfUsername: UnderlineTextField! {
        didSet {
            tfUsername.clearButtonMode = .whileEditing
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
}

// MARK: View Controller Actions
extension LoginViewController {
    @IBAction fileprivate func didTapBTNLogin(_ sender: UIButton) {
        tfUsername.resignFirstResponder()
        tfPassword.resignFirstResponder()
        
        showProgress(message: "Logging in...")
        login { [weak self] error in
            guard let weakSelf = self else {
                return
            }
            
            weakSelf.dismissProgress()
            
            guard let _ = error else {
                weakSelf.dismiss(animated: true, completion: nil)
                return
            }
            
            
            weakSelf.showToast(AppError.login.localizedDescription)
        }
    }
    
    @IBAction fileprivate func didTapBTNClose(_ sender: UIButton) {
        tfUsername.resignFirstResponder()
        tfPassword.resignFirstResponder()
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction fileprivate func didTapBTNSignup(_ sender: UIButton) {
        performSegue(withIdentifier: "OpenSignup", sender: self)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        tfUsername.resignFirstResponder()
        tfPassword.resignFirstResponder()
    }
}

extension LoginViewController {
    fileprivate func login(completion: @escaping (_ error: NSError?) -> Void) {
        guard let username = tfUsername.text, let password = tfPassword.text else {
            completion(AppError.login)
            return
        }
        
        let userVM = UserViewModel()
        userVM.login(username: username, password: password) { (token, error) in
            guard let sessionToken = token else {
                completion(error)
                return
            }
            
            let session = APISession(token: sessionToken)
            APISession.current = session
            
            completion(nil)
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField == tfUsername {
            tfPassword.becomeFirstResponder()
        }

        return true
    }
}
