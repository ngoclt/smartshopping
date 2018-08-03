//
//  StoreDetailViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class StoreDetailViewController: BaseViewController {
    
    static let PRODUCT_ITEM_MARGIN: CGFloat = 10
    static let NUMBER_ITEMS_PER_ROW: Int = 2
    static let PRODUCT_ITEM_HEIGHT: CGFloat = 170
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
    var store: Store!
    var products: [Product] = []
    var categories: [Category] = []
    let viewModel = StoreViewModel()
    
    var selectedFilter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.setTitle(title: store.name, subtitle: store.address)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareCollectionViewLayout()
        refreshData()
    }
}

extension StoreDetailViewController {
    
    fileprivate func prepareCollectionViewLayout() {
        let collectionViewLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = (collectionView.bounds.width -
            StoreDetailViewController.PRODUCT_ITEM_MARGIN * CGFloat(StoreDetailViewController.NUMBER_ITEMS_PER_ROW + 1)) /  CGFloat(StoreDetailViewController.NUMBER_ITEMS_PER_ROW)
        collectionViewLayout.itemSize = CGSize(width: itemWidth, height: StoreDetailViewController.PRODUCT_ITEM_HEIGHT)
        collectionViewLayout.minimumLineSpacing = StoreDetailViewController.PRODUCT_ITEM_MARGIN
        collectionViewLayout.minimumInteritemSpacing = StoreDetailViewController.PRODUCT_ITEM_MARGIN
    }
    
    fileprivate func fetchProducts() {
        var categoryId: Int64 = 0
        if selectedFilter > 0 {
            let category = categories[selectedFilter - 1]
            categoryId = category.objectId
        }
        viewModel.fetchProduct(storeId: store.objectId, categoryId: categoryId) { [weak self] response, error in
            guard let strongSelf = self else {
                return
            }
            
            if let products = response?.results {
                strongSelf.products = products
                strongSelf.collectionView.reloadData()
            } else {
                strongSelf.showErrorToast(error)
            }
        }
    }
    
    fileprivate func fetchCategories() {
        viewModel.fetchCategory(storeId: store.objectId) { [weak self] response, error in
            guard let strongSelf = self else {
                return
            }
            if let categories = response?.results {
                strongSelf.categories = categories
                strongSelf.collectionView.reloadData()
            } else {
                strongSelf.showErrorToast(error)
            }
        }
    }
    
    fileprivate func refreshData() {
        fetchCategories()
        fetchProducts()
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "StoreCategoryFilterView", for: indexPath) as! StoreCategoryFilterView
        view.reloadData(categories, filter: selectedFilter)
        view.delegate = self
        return view
    }
}

extension StoreDetailViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}

extension StoreDetailViewController: StoreCategoryFilterViewDelegate {
    
    func didSelectCategoryFilter(_ index: Int) {
        selectedFilter = index
        fetchProducts()
    }
}
