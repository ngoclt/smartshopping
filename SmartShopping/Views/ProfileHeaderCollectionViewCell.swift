//
//  ProfileHeaderCollectionViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/13/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit


class ProfileHeaderCollectionViewCell: UICollectionReusableView {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var btnAvatar: UIButton!
    @IBOutlet weak var ivAvatar: UIImageView!
    
    var shopper: Shopper! {
        didSet {
            lblName.text = shopper.fullName
            lblUsername.text = shopper.username
            lblEmail.text = shopper.email
            ivAvatar.setImageURL(shopper.avatar)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
