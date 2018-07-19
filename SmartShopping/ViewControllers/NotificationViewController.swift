//
//  NotificationViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    @IBOutlet var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Notifications"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnLogin.isHidden = (APISession.current != nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath)
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension NotificationViewController {
    @IBAction fileprivate func didTapBTNLogin(_ sender: UIButton) {
        log.info("Login from Notification")
        tabBarController?.performSegue(withIdentifier: "OpenLogin", sender: self)
    }
}
