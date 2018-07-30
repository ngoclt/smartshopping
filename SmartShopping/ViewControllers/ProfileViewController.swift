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
    
    @IBOutlet fileprivate var collectionView: UICollectionView!
    
    let viewModel = UserViewModel()
    var interests: [Interest] = []
    
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
    
    @IBAction fileprivate func didTapBTNLogout(_ sender: UIButton) {
        let userVM = UserViewModel()
        userVM.logout { error in
            self.navigationController?.tabBarController?.navigationController?.popViewController(animated: true)
        }
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
        fetchUserInfo()
    }
    
    private func fetchUserInfo() {
        showProgress(message: "Loading...")
        viewModel.fetchLoggedInShopper { [weak self] (result, error) in
            guard let strongSelf = self else {
                return
            }
            
            if let _ = error {
                strongSelf.showErrorToast(error)
            } else {
                // Fetch user interests after having user information
                strongSelf.fetchUserInterests()
                strongSelf.collectionView.reloadData()
            }
            strongSelf.dismissProgress()
        }
    }
    
    private func fetchUserInterests() {
        viewModel.fetchInterests { [weak self] response, error in
            guard let strongSelf = self else {
                return
            }
            
            if let _ = error {
                strongSelf.showErrorToast(error)
            } else if let interests = response?.results {
                strongSelf.interests = interests
                strongSelf.collectionView.reloadData()
            }
        }
    }
}

extension ProfileViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InterestCollectionViewCell", for: indexPath) as! InterestCollectionViewCell
        let interest = interests[indexPath.item]
        if let product = interest.product {
            cell.item = product
        } else if let category = interest.category {
            cell.item = category
        }
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
