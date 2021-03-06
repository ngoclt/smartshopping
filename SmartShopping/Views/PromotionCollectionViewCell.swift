//
//  PromotionCollectionViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate var ivThumb: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var lblTitle: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var lblDescription: UILabel! {
        didSet {
            
        }
    }
    
    func refreshData(_ item: String) {
        self.ivThumb.image = UIImage(named: item)
    }
}
