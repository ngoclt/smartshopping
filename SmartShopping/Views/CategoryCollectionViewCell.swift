//
//  CategoryCollectionViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/10/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refreshData(_ item: String) {
        self.ivThumb.image = UIImage(named: item)
    }
}
