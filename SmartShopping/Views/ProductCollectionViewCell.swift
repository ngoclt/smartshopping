//
//  ProductCollectionViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet fileprivate var ivThumb: UIImageView!
    
    @IBOutlet fileprivate var lblTitle: UILabel!
    
    @IBOutlet fileprivate var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func refreshData(_ item: String) {
        self.ivThumb.image = UIImage(named: item)
    }
}
