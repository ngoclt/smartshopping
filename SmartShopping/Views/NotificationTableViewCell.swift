//
//  NotificationTableViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 11/24/17.
//  Copyright © 2017 Ngoc LE. All rights reserved.
//

import UIKit
import Material

class NotificationTableViewCell: TableViewCell {
    
    @IBOutlet fileprivate var btnThumb: FlatButton! {
        didSet {
            btnThumb.layer.cornerRadius = btnThumb.bounds.size.width/2
            btnThumb.layer.masksToBounds = true
            btnThumb.layer.borderColor = Color.teal.base.cgColor
            btnThumb.layer.borderWidth = 1.0
        }
    }
    
    @IBOutlet fileprivate var btnCheck: FlatButton! {
        didSet {
            btnCheck.setImage(Icon.check?.tint(with: Color.orange.base), for: .normal)
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
    
    @IBAction fileprivate func didTapBTNThumb(_ sender: UIButton) {
        
    }
    
    @IBAction fileprivate func didTapBTNCheck(_ sender: UIButton) {
        
    }
}
