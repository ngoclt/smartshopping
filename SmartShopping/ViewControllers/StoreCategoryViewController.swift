//
//  StoreCategoryViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class StoreCategoryViewController: BaseViewController {
    
    @IBOutlet fileprivate var collectionView: UICollectionView! {
        didSet {
            
        }
    }
    
    var dataSourceItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Stores"
        
        prepareDataSourceItems()
        prepareCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }
}

extension StoreCategoryViewController {
    fileprivate func prepareDataSourceItems() {
        
        
    }
    
    fileprivate func prepareCollectionView() {
//        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewLayout
    }
}

extension StoreCategoryViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
        return cell
    }
}

extension StoreCategoryViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "OpenStoreProductFromCategory", sender: self)
    }
}
