//
//  String+Format.swift
//  weathr
//
//  Created by Smart&Soft on 20/04/2017.
//  Copyright © 2017 Smart&Soft. All rights reserved.
//

import Foundation

extension String {
    
    var capitalizeFirst: String {
        if isEmpty { return "" }
        var result = self
        result.replaceSubrange(startIndex...startIndex, with: String(self[startIndex]).uppercased())
        return result
    }
    
}
