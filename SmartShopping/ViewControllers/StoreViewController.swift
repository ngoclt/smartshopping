//
//  ViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class StoreViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataSourceItems: [Store] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Stores"
        refreshData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension StoreViewController {
    func refreshData() {
        let viewModel = StoreViewModel()
        viewModel.fetchList { [weak self] response, error in
            guard let strongSelf = self else {
                return
            }
            
            if let stores = response?.results {
                strongSelf.dataSourceItems = stores
            } else {
                log.error(error)
            }
        }
    }
}

extension StoreViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
        cell.data = dataSourceItems[indexPath.row]
        return cell
    }
}

extension StoreViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "OpenStoreCategory", sender: self)
    }
}
