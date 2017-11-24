//
//  StoreTableViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import Material

class StoreTableViewCell: TableViewCell {
    
    @IBOutlet fileprivate var lblName: UILabel! {
        didSet {
            lblName.textColor = Color.orange.base
        }
    }
    
    @IBOutlet fileprivate var lblAddress: UILabel! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var ivThumb: UIImageView! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var btnFavorite: FlatButton! {
        didSet {
            btnFavorite.setImage(Icon.favorite?.tint(with: Color.red.base), for: .normal)
        }
    }
    
    @IBOutlet fileprivate var btnShare: FlatButton! {
        didSet {
            btnShare.setImage(Icon.share?.tint(with: Color.blue.base), for: .normal)
        }
    }
    
    @IBOutlet fileprivate var lblOpeningTime: UILabel! {
        didSet {
            lblOpeningTime.textColor = Color.lightGreen.base
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction fileprivate func didTapBTNFavorite(_ sender: UIButton) {
        
    }
    
    @IBAction fileprivate func didTapBTNShare(_ sender: UIButton) {
        
    }
}

