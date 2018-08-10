//
//  InterestCollectionViewCell.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/13/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var ivThumb: UIImageView!
    @IBOutlet weak var btnLike: UIButton!
    
    var interestId: Int64 = 0
    var item: Likable!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func reloadData() {
        lblTitle.text = item.title()
        ivThumb.setImageURL(item.imageThumbnail())
        
        let color = item.status() ? Color.liked : Color.unliked
        btnLike.setTitleColor(color.value, for: .normal)
    }
}
