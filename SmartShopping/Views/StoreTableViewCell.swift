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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let shadowPath = UIBezierPath(rect: vContainer.bounds)
        vContainer.layer.masksToBounds = false
        vContainer.layer.shadowColor = UIColor.darkGray.cgColor
        vContainer.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        vContainer.layer.shadowOpacity = 0.3
        vContainer.layer.shadowPath = shadowPath.cgPath
    }

    
    private func reloadData() {
        lblName.text = data.name
        lblAddress.text = data.address
        ivThumb.setImageURL(data.imageCover)
    }
    
    @IBAction fileprivate func didTapBTNLike(_ sender: UIButton) {
        
    }}

