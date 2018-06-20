//
//  LoginViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet fileprivate var tfEmail: UITextField! {
        didSet {
            tfEmail.clearButtonMode = .whileEditing
            tfEmail.textColor = .darkGray
        }
    }
    @IBOutlet fileprivate var tfPassword: UITextField! {
        didSet {
            tfPassword.clearButtonMode = .whileEditing
            tfPassword.textColor = .darkGray
        }
    }
    
    @IBOutlet fileprivate var btnLogin: UIButton! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var btnClose: UIButton! {
        didSet {
//            btnClose.image = Icon.close
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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

extension LoginViewController: UITextFieldDelegate {
    public func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    public func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    

        return true
    }
}
