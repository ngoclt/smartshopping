//
//  RoundedImageView.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/5/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

@IBDesignable class RoundedImageView: UIImageView {
    @IBInspectable var borderColor = UIColor.clear {
        willSet {
            layer.borderColor = newValue.cgColor
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = borderColor.cgColor
    }
}
