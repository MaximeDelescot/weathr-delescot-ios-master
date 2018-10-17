//
//  Weather.swift
//  weathr
//
//  Created by Maxime Delescot on 17/10/2018.
//  Copyright © 2018 Smart&Soft. All rights reserved.
//

import UIKit

class Weather: NSObject {
    
    let date: NSDate?
    let temperatureMin: Int?
    let temperatureMax: Int?
    let type: String?
    let uvIndex: Int?
    let windDirection: String?
    let windSpeed: Int?
    

    
    init(date: NSDate, tempMin: Int, tempMax: Int, type: String, uvInd: Int, windDir: String, windSpeed: Int) {
        
        self.date = date
        self.temperatureMin = tempMin
        self.temperatureMax = tempMax
        self.type = type
        self.uvIndex = uvInd
        self.windDirection = windDir
        self.windSpeed = windSpeed
    }

    
}
