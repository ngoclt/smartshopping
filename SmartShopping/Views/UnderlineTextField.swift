//
//  UnderlineTextField.swift
//  SmartShopping
//
//  Created by Ngoc LE on 7/13/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import UIKit

@IBDesignable
class UnderlineTextField: UITextField {
    
    @IBInspectable var leftIcon: String! {
        didSet {
            let iconLabel = UILabel()
            iconLabel.text = leftIcon
            iconLabel.textColor = UIColor.white.withAlphaComponent(0.5)
            iconLabel.font = FontBook.awesomeSolid.of(size: 20)
            iconLabel.sizeToFit()
            var frame = iconLabel.frame
            frame.size.width = frame.size.width + leftPadding
            iconLabel.frame = frame
            leftView = iconLabel
        }
    }
    
    @IBInspectable var leftPadding: CGFloat = 10
    
    @IBInspectable var bottomLineColor: UIColor! {
        didSet {
            borderLayer.borderColor = bottomLineColor.cgColor
        }
    }
    
    private var borderLayer = CALayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseInit()
    }
    
    func baseInit() {
        bottomLineColor = .clear
        borderLayer.borderColor = bottomLineColor.cgColor
        layer.addSublayer(borderLayer)
        layer.masksToBounds = true
        
        leftViewMode = .always
    }
    
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.leftViewRect(forBounds: bounds)
        textRect.origin.x += leftPadding

        return textRect
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let width = CGFloat(1.0)
        borderLayer.frame = CGRect(x: 0, y: frame.size.height - width,
                                   width: frame.size.width, height: self.frame.size.height)
        borderLayer.borderWidth = width
    }
}
