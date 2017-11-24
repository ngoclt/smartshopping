//
//  PromotionViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import Material

class PromotionViewController: BaseViewController {
    
    @IBOutlet fileprivate var collectionView: CollectionView! {
        didSet {
            collectionView.backgroundColor = Color.lime.lighten5
        }
    }
    
    @IBOutlet fileprivate var pageControl: UIPageControl! {
        didSet {
            pageControl.pageIndicatorTintColor = Color.lightGray
            pageControl.currentPageIndicatorTintColor = Color.lightGreen.base
        }
    }
    
    var dataSourceItems = [DataSourceItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Promotions"
        
        view.backgroundColor = Color.teal.base
        
        prepareDataSourceItems()
        prepareCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pageControl.numberOfPages = dataSourceItems.count
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PromotionViewController {
    fileprivate func prepareDataSourceItems() {
        let data = ["meditation.jpg", "yoga.jpg", "surf.jpg"]
        
        data.forEach { [unowned self, w = view.bounds.size.width, h = view.bounds.size.height] (item) in
            self.dataSourceItems.append(DataSourceItem(data: item, width: w, height: h))
        }
    }
    
    fileprivate func prepareCollectionView() {
        let collectionViewLayout = collectionView.collectionViewLayout as! CollectionViewLayout
        collectionViewLayout.scrollDirection = .horizontal
        collectionView.interimSpacePreset = .none
    }
}

extension PromotionViewController: CollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSourceItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PromotionCollectionViewCell", for: indexPath) as! PromotionCollectionViewCell
        cell.refreshData(dataSourceItems[indexPath.row])
        return cell
    }
}

extension PromotionViewController: CollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
}
