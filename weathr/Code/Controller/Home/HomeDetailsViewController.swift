//
//  HomeDetailsViewController.swift
//  weathr
//
//  Created by Smart&Soft on 02/03/2016.
//  Copyright © 2016 Smart&Soft. All rights reserved.
//

import UIKit

class HomeDetailsViewController: UIViewController {
    
    var weather : Weather?
    var color: UIColor?
    
    @IBOutlet weak var windTitleLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var uvTitleLabel: UILabel!
    @IBOutlet weak var uvLabel: UILabel!
    @IBOutlet weak var tempMaxTitleLabel: UILabel!
    @IBOutlet weak var tempMaxLabel: UILabel!
    @IBOutlet weak var tempMinTitleLabel: UILabel!
    @IBOutlet weak var tempMinLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.windTitleLabel.text = NSLocalizedString("WIND", comment: "")
        self.uvTitleLabel.text = NSLocalizedString("UVINDEX", comment: "")
        self.tempMaxTitleLabel.text = NSLocalizedString("TEMPMAX", comment: "")
        self.tempMinTitleLabel.text = NSLocalizedString("TEMPMIN", comment: "")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = self.color
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, yyyy"
        self.dateLabel.text = dateFormatter.string(from: self.weather?.date! as! Date)
        
        self.weatherImage.image = WeathR.getImageForType(type: (self.weather?.type)!)

        self.tempLabel.text = "\(self.weather?.temperatureMax ?? 0)°C"

        self.tempMaxLabel.text = "\(self.weather?.temperatureMax ?? 0)°C"
        self.tempMinLabel.text = "\(self.weather?.temperatureMin ?? 0)°C"
        self.uvLabel.text = "\(self.weather?.uvIndex ?? 0)"
        self.windLabel.text = (self.weather?.windDirection)! + " / \(self.weather?.windSpeed ?? 0)"

    }
    
    func configWithWeather(weather: Weather, color: UIColor) {
        
        self.weather = weather
        self.color = color
        
    }

}
