//
//  NotificationViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class NotificationViewController: BaseViewController {
    
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = NotificationViewModel()
    
    var dataSourceItems: [StoreNotification] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    var selectedNotification: StoreNotification?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Notifications"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        btnLogin.isHidden = (APISession.current != nil)
        
        refreshData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? StoreDetailViewController,
            let notification = selectedNotification, let store = notification.store else {
                return
        }
        
        viewController.store = store
        if let category = notification.category {
            viewController.selectedCategoryId = category.objectId
        } else if let product = notification.product {
            viewController.selectedProductId = product.objectId
        }
    }
}

extension NotificationViewController {
    func refreshData() {
        showProgress(message: "Loading...")
        
        viewModel.fetchUserNotifications { [weak self] response, error in
            guard let strongSelf = self else {
                return
            }
            
            if let stores = response?.results {
                strongSelf.dataSourceItems = stores
            } else {
                strongSelf.showErrorToast(error)
            }
            
            strongSelf.dismissProgress()
        }
    }
}

extension NotificationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTableViewCell", for: indexPath) as! NotificationTableViewCell
        cell.data = dataSourceItems[indexPath.row]
        return cell
    }
}

extension NotificationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedNotification = dataSourceItems[indexPath.item]
        performSegue(withIdentifier: "OpenStoreDetailFromNotification", sender: self)
    }
}

extension NotificationViewController {
    @IBAction fileprivate func didTapBTNLogin(_ sender: UIButton) {
        tabBarController?.performSegue(withIdentifier: "OpenLogin", sender: self)
    }
}
