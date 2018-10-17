//
//  String+WeathR.swift
//  weathr
//
//  Created by Smart&Soft on 02/03/2016.
//  Copyright © 2016 Smart&Soft. All rights reserved.
//

import UIKit

struct WeathR {
    
    struct Colors {
        static let watermelon: UInt = 0xFF5670
        static let yellow: UInt = 0xFFCE00
        static let darkMagenta: UInt = 0xA90097
        static let greenBlue: UInt = 0x08A4A9
    }
    
    static  func forecastColor(index pIndex:Int) -> UIColor {
        let arrayColor = [
            UIColor(hexString: Colors.watermelon),
            UIColor(hexString: Colors.yellow),
            UIColor(hexString: Colors.darkMagenta),
            UIColor(hexString: Colors.greenBlue),
            ]
        return arrayColor[(pIndex % arrayColor.count)]
    }
    
    static func applyTheme(_ navigationBar:UINavigationBar?) {
        navigationBar?.isTranslucent = false
        navigationBar?.tintColor = WeathR.forecastColor(index: 0)
        navigationBar?.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)
        navigationBar?.shadowImage = UIImage()
      navigationBar?.titleTextAttributes = [NSAttributedStringKey.foregroundColor:WeathR.forecastColor(index: 0)]
    }
}
