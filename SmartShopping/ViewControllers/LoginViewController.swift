//
//  LoginViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import Material

class LoginViewController: BaseViewController {
    
    @IBOutlet fileprivate var tfEmail: ErrorTextField! {
        didSet {
            tfEmail.clearButtonMode = .whileEditing
            tfEmail.isClearIconButtonEnabled = true
            tfEmail.placeholderActiveColor = Color.darkGray
            tfEmail.dividerActiveColor = Color.darkGray
            tfEmail.textColor = Color.darkGray
        }
    }
    @IBOutlet fileprivate var tfPassword: TextField! {
        didSet {
            tfPassword.clearButtonMode = .whileEditing
            tfPassword.isVisibilityIconButtonEnabled = true
            tfPassword.placeholderActiveColor = Color.darkGray
            tfPassword.dividerActiveColor = Color.darkGray
            tfPassword.textColor = Color.darkGray
            
            // Setting the visibilityIconButton color.
            tfPassword.visibilityIconButton?.tintColor = Color.lightGreen.base
        }
    }
    
    @IBOutlet fileprivate var btnLogin: FlatButton! {
        didSet {
            btnLogin.backgroundColor = Color.lightGreen.base
        }
    }
    
    @IBOutlet fileprivate var btnClose: FlatButton! {
        didSet {
            btnClose.image = Icon.close
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = Color.lime.lighten5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction fileprivate func didTapBTNLogin(_ sender: UIButton) {
        tfEmail.resignFirstResponder()
        tfPassword.resignFirstResponder()
        
        //TODO: Process for login here
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction fileprivate func didTapBTNClose(_ sender: UIButton) {
        tfEmail.resignFirstResponder()
        tfPassword.resignFirstResponder()
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension LoginViewController: TextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        (textField as? ErrorTextField)?.isErrorRevealed = false
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        (textField as? ErrorTextField)?.isErrorRevealed = true

        return true
    }
}
