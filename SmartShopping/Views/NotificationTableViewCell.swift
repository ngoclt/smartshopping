//
//  NotificationTableViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit

class NotificationTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate var btnStore: UIButton! {
        didSet {
            btnStore.layer.cornerRadius = btnStore.bounds.size.width/2
            btnStore.layer.masksToBounds = true
            btnStore.layer.borderWidth = 1.0
            btnStore.layer.borderColor = UIColor.white.cgColor
        }
    }
    
    @IBOutlet fileprivate var lblTitle: UILabel!
    @IBOutlet fileprivate var lblDescription: UILabel!
    @IBOutlet fileprivate var ivThumb: UIImageView! {
        didSet {
            ivThumb.layer.cornerRadius = 5
            ivThumb.layer.masksToBounds = true
        }
    }
    
    var data: StoreNotification! {
        didSet {
            reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func reloadData() {
        lblTitle.text = data.title
        lblDescription.text = data.message
        ivThumb.setImageURL(data.thumb)
        
        btnStore.setImageURL(data.store?.imageCover)
    }
    
    @IBAction fileprivate func didTapBTNStore(_ sender: UIButton) {
        
    }
}
