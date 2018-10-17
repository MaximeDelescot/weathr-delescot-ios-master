//
//  WeatherManager.swift
//  weathr
//
//  Created by Maxime Delescot on 17/10/2018.
//  Copyright © 2018 Smart&Soft. All rights reserved.
//

import UIKit

class WeatherManager: NSObject {

    public static let sharedInstance = WeatherManager()
    var weatherArray = [Weather]()


    func loadWeather(city: String, forecasts: Int, completion: @escaping (Bool) -> Void) {
        
        var weatherArray = [Weather]()
        let filename : String = "city=" + city + "&forecasts=" + String(forecasts)
        WebServiceManager.sharedInstance.getDicoFromfile(fileName: filename) { (dico) in
            
            if dico != nil{
                                
                let array = dico?.object(forKey: "forecasts") as! NSArray
                
                for weatherInfo in array{
                    
                    let weatherDico = weatherInfo as! NSDictionary
                    

                    let dateFmt = DateFormatter()
                    dateFmt.timeZone = NSTimeZone.default
                    dateFmt.dateFormat =  "yyyy-MM-dd"
                    let date = dateFmt.date(from: weatherDico.object(forKey: "date") as! String)
                    
                    let weather = Weather(date: date! as NSDate,
                                          tempMin: weatherDico.object(forKey: "temperatureMin") as! Int,
                                          tempMax: weatherDico.object(forKey: "temperatureMax") as! Int,
                                          type: weatherDico.object(forKey: "type") as! String,
                                          uvInd: weatherDico.object(forKey: "uvIndex") as! Int,
                                          windDir: weatherDico.object(forKey: "windDirection") as! String,
                                          windSpeed: weatherDico.object(forKey: "windSpeed") as! Int)
                    
                    weatherArray.append(weather)
                    
                }
                self.weatherArray = weatherArray
                completion(true)
            }
            completion(false)
        }
    }
    
}
