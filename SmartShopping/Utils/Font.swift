//
//  Font.swift
//  SmartShopping
//
//  Created by Ngoc LE on 6/20/18.
//  Copyright © 2018 Ngoc LE. All rights reserved.
//

import Foundation
import UIKit

enum FontBook: String {
    case robotoBlack            = "Roboto-Black"
    case robotoBlackItalic      = "Roboto-BlackItalic"
    case robotoBold             = "Roboto-Bold"
    case robotoBoldItalic       = "Roboto-BoldItalic"
    case robotoItalic           = "Roboto-Italic"
    case robotoLight            = "Roboto_Light"
    case robotoLightItalic      = "Roboto-LightItalic"
    case robotoMedium           = "Roboto-Medium"
    case robotoMediumItalic     = "Roboto-MediumItalic"
    case robotoRegular          = "Roboto-Regular"
    case robotoThin             = "Roboto-Thin"
    case robotoThinItalic       = "Roboto-ThinItalic"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

class Utility {
    /// Logs all available fonts from iOS SDK and installed custom font
    class func logAllAvailableFonts() {
        for family in UIFont.familyNames {
            print("\(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("   \(name)")
            }
        }
    }
}

