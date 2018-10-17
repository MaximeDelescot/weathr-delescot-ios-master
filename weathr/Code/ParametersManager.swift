//
//  ParametersManager.swift
//  weathr
//
//  Created by Maxime Delescot on 17/10/2018.
//  Copyright © 2018 Smart&Soft. All rights reserved.
//

import UIKit

class ParametersManager: NSObject {

    public static let sharedInstance = ParametersManager()
    var city : String?
    var number : Int?
    
    override init() {
        
        self.city = "Paris"
        self.number = 7
    }
    
    func changeParameters(city: String, number: Int)  {
        
        self.city = city
        self.number = number
    }
    
    
}
