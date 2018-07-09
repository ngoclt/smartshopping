//
//  StoreTableViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import AlamofireImage

class StoreTableViewCell: UITableViewCell {
    
    var data: Store! {
        didSet {
            reloadData()
        }
    }
    
    @IBOutlet fileprivate var lblName: UILabel!
    @IBOutlet fileprivate var lblAddress: UILabel!
    @IBOutlet fileprivate var ivThumb: UIImageView!
    @IBOutlet fileprivate var btnFavorite: UIButton!
    @IBOutlet fileprivate var vContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    private func reloadData() {
        lblName.text = data.name.uppercased()
        lblAddress.text = data.address
        ivThumb.setImageURL(data.imageCover)
    }
    
    @IBAction fileprivate func didTapBTNLike(_ sender: UIButton) {
        
    }}

