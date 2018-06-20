//
//  PromotionViewController.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class PromotionViewController: BaseViewController {
    
    @IBOutlet fileprivate var collectionView: UICollectionView! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var pageControl: UIPageControl! {
        didSet {
            pageControl.pageIndicatorTintColor = .lightGray
            pageControl.currentPageIndicatorTintColor = .green
        }
    }
    
    var dataSourceItems: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "Promotions"
    
        
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
    }
    
    fileprivate func prepareCollectionView() {
    }
}

extension PromotionViewController: UICollectionViewDataSource {
    
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

extension PromotionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
}
