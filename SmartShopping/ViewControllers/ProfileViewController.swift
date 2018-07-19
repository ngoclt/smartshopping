//
//  ProfileViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController {
    
    static let PRODUCT_ITEM_MARGIN: CGFloat = 10
    static let NUMBER_ITEMS_PER_ROW: Int = 3
    
    @IBOutlet fileprivate var collectionView: UICollectionView! {
        didSet {
            
        }
    }
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Profile"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCollectionViewLayout()
        refreshData()
    }
}

extension ProfileViewController {
    
    fileprivate func prepareCollectionViewLayout() {
        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemSize = (collectionView.bounds.width -
            ProfileViewController.PRODUCT_ITEM_MARGIN * CGFloat(ProfileViewController.NUMBER_ITEMS_PER_ROW + 1)) /  CGFloat(ProfileViewController.NUMBER_ITEMS_PER_ROW)
        collectionViewLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        collectionViewLayout.minimumLineSpacing = ProfileViewController.PRODUCT_ITEM_MARGIN
        collectionViewLayout.minimumInteritemSpacing = ProfileViewController.PRODUCT_ITEM_MARGIN
    }
    
    fileprivate func refreshData() {
        let userVM = UserViewModel()
        userVM.fetchLoggedInShopper { (result, error) in
            if let _ = error {
                self.showErrorToast(error!.localizedDescription)
            } else {
                self.collectionView.reloadData()
            }
        }
        
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCollectionViewCell", for: indexPath) as! InterestCollectionViewCell
        return cell
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeaderCollectionViewCell", for: indexPath) as! ProfileHeaderCollectionViewCell
        if let shopper = UserViewModel.currentUser {
            headerView.shopper = shopper
        }
        
        return headerView
    }
}
