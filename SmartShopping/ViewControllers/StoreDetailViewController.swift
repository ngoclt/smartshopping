//
//  StoreDetailViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class StoreDetailViewController: BaseViewController {
    
    @IBOutlet fileprivate var collectionView: UICollectionView! {
        didSet {
            
        }
    }
    
    var store: Store!
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.setTitle(title: store.name, subtitle: store.address)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshData()
    }
}

extension StoreDetailViewController {
    fileprivate func refreshData() {
        let viewModel = StoreViewModel()
        viewModel.fetchProduct(storeId: store.objectId) { [weak self] response, error in
            guard let strongSelf = self else {
                return
            }
            
            if let products = response?.results {
                strongSelf.products = products
                strongSelf.collectionView.reloadData()
            } else {
                log.error(error)
            }
        }
    }
}

extension StoreDetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
        cell.data = products[indexPath.item]
        return cell
    }
}

extension StoreDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
