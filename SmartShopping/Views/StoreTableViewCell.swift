//
//  StoreTableViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class StoreTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate var lblName: UILabel! {
        didSet {
            
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
    
    @IBOutlet fileprivate var btnFavorite: UIButton! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var btnShare: UIButton! {
        didSet {
            
        }
    }
    
    @IBOutlet fileprivate var lblOpeningTime: UILabel! {
        didSet {
            
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

