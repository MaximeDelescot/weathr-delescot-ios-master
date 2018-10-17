//
//  WeatherCollectionViewCell.swift
//  weathr
//
//  Created by Maxime Delescot on 17/10/2018.
//  Copyright © 2018 Smart&Soft. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    var weather: Weather?
    var index: Int?

    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configWitWeather(weather: Weather, index: Int) {
        
        self.weather = weather
        self.index = index
        
        self.layer.cornerRadius = 30;
        self.layer.masksToBounds = true;
        
        self.temperatureLabel.text = "\(self.weather?.temperatureMax ?? 0)°C"
        
        self.weatherImage.image = WeathR.getImageForType(type: (self.weather?.type)!)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        self.dateLabel.text = dateFormatter.string(from: self.weather?.date! as! Date)
        
        self.backgroundColor = WeathR.forecastColor(index: self.index!)
    }
    
    

}
