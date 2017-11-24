//
//  PromotionCollectionViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import Material

class PromotionCollectionViewCell: CollectionViewCell {
    
    @IBOutlet fileprivate var ivThumb: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var lblTitle: UILabel! {
        didSet {
            lblTitle.textColor = Color.orange.base
        }
    }
    
    @IBOutlet fileprivate var lblDescription: UILabel! {
        didSet {
            
        }
    }
    
    func refreshData(_ item: DataSourceItem) {
        if let image = item.data as? String {
            self.ivThumb.image = UIImage(named: image)
        }
    }
}
