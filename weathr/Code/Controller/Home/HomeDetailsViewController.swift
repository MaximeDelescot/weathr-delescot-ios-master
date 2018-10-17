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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = self.color
    }
    
    func configWithWeather(weather: Weather, color: UIColor) {
        
        self.weather = weather
        self.color = color
        
    }

}
