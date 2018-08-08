//
//  NearbyViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class NearbyViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    fileprivate var selectedStore: Store?
    
    let viewModel = StoreViewModel()
    var dataSourceItems: [Store] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Nearby"
        registerBeaconNotification()
        EstimoteManager.shared.startObserving()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    deinit {
        unregisterBeaconNotification()
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

extension NearbyViewController {
    func registerBeaconNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(onEnter(notification:)),
                                               name: Notification.Name.onEnterNewZone, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onExit(notification:)),
                                               name: Notification.Name.onEnterNewZone, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onEnter(notification:)),
                                               name: Notification.Name.onEnterNewZone, object: nil)
    }
    
    func unregisterBeaconNotification() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func onEnter(notification: Notification) {
        guard let nearbyBeacon = notification.object as? NearbyBeacon else {
            return
        }
        
        fetchBeaconInfo(beaconId: nearbyBeacon.identifier)
    }
    
    @objc func onExit(notification: Notification) {
        
    }
    
    @objc func onChange(notification: Notification) {
        
    }
    
    func fetchBeaconInfo(beaconId: String) {
        viewModel.fetchBeacon(beaconId) { beacon, error in
            if let storeBeacon = beacon, let store = storeBeacon.store {
                if self.dataSourceItems.contains(where: { $0.objectId == store.objectId }) {
                    return
                }
                
                self.dataSourceItems.append(store)
                self.tableView.reloadData()
            }
        }
    }
}

extension NearbyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataSourceItems.count > 0 {
            return dataSourceItems.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if dataSourceItems.count > 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StoreTableViewCell", for: indexPath) as! StoreTableViewCell
            cell.data = dataSourceItems[indexPath.row]
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoStoreTableViewCell", for: indexPath) as! NoStoreTableViewCell
        return cell
    }
}

extension NearbyViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedStore = dataSourceItems[indexPath.row]
        self.performSegue(withIdentifier: "OpenStoreDetailFromNearby", sender: self)
    }
}
