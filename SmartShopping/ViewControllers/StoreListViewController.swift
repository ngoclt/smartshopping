//
//  StoreListViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class StoreListViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var selectedStore: Store?
    fileprivate let viewModel = StoreViewModel()
    
    var dataSourceItems: [Store] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Stores"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? StoreDetailViewController,
            let store = selectedStore else {
            return
        }
        
        viewController.store = store
    }
}

extension StoreListViewController {
    func refreshData() {
        showProgress(message: "Loading")
        
        viewModel.fetchList { [weak self] response, error in
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

extension StoreListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        cell.data = dataSourceItems[indexPath.row]
        return cell
    }
}

extension StoreListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStore = dataSourceItems[indexPath.row]
        self.performSegue(withIdentifier: "OpenStoreDetailFromList", sender: self)
    }
}
