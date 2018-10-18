//
//  HomeViewController.swift
//  weathr
//
//  Created by Smart&Soft on 01/03/2016.
//  Copyright © 2016 Smart&Soft. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    
    override func viewDidLoad() {
      
    super.viewDidLoad()
    WeathR.applyTheme(self.navigationController?.navigationBar)
      
      
    self.weatherCollectionView.delegate = self
    self.weatherCollectionView.dataSource = self
    self.weatherCollectionView.register(UINib.init(nibName: "WeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCollectionViewCell")

  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    self.loadWeather()

  }
  
  func loadWeather() {

    self.title = NSLocalizedString(ParametersManager.sharedInstance.city!.uppercased(), comment: "")
    WeatherManager.sharedInstance.loadWeather(city: ParametersManager.sharedInstance.city!, forecasts: ParametersManager.sharedInstance.number!) { (succed) in
      
      self.weatherCollectionView.reloadData()
    }
  }
  
  //MARK: Action
  @IBAction func showAboutAction(_ sender: AnyObject) {
    let storyboard = UIStoryboard(name: "About", bundle: nil)
    let controller = storyboard.instantiateInitialViewController()
    self.present(controller!, animated: true, completion: nil)
  }
  
  //MARK: CollectionView Datasource & Delegate
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return WeatherManager.sharedInstance.weatherArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = self.weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as! WeatherCollectionViewCell
    cell.configWitWeather(weather: WeatherManager.sharedInstance.weatherArray[indexPath.item], index: indexPath.item)
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
  {
    if(UIDevice.current.userInterfaceIdiom == .pad){
      
        return CGSize(width: self.weatherCollectionView.frame.size.width/2, height: self.weatherCollectionView.frame.size.width/2)
    }
    else{
      return CGSize(width: self.weatherCollectionView.frame.size.width, height: self.weatherCollectionView.frame.size.width)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
      let viewController = storyboard?.instantiateViewController(withIdentifier: "HomeDetailsViewController") as! HomeDetailsViewController
    viewController.configWithWeather(weather: WeatherManager.sharedInstance.weatherArray[indexPath.item], color: WeathR.forecastColor(index: indexPath.item))
      navigationController?.pushViewController(viewController,animated: true)
    
  }
  
  //MARK: button action
  
  @IBAction func parameterButtonTapped(_ sender: Any) {
    
    self.displayParameterAlert()
  }
  
  func displayParameterAlert(){
    
    let alert = UIAlertController(title: NSLocalizedString("PARAMETERS", comment: ""), message: nil, preferredStyle: .alert)
    
    alert.addTextField(configurationHandler: { textField in
      textField.placeholder = NSLocalizedString("CITY", comment: "")
    })
    
    alert.addTextField(configurationHandler: { textField in
      textField.placeholder = NSLocalizedString("NUMBERDAYS", comment: "")
    })
    
    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { action in
      
      let nameField = alert.textFields![0] as UITextField
      let numberField = alert.textFields![1] as UITextField
      
      if( nameField.text?.lowercased().elementsEqual("paris") == false &&
        nameField.text?.lowercased().elementsEqual("milan") == false &&
        nameField.text?.lowercased().elementsEqual("london") == false && nameField.text?.lowercased().elementsEqual("londres") == false){
        
          self.displayAlertErrorWithMessage(message: NSLocalizedString("INVALIDATEDCITY", comment: ""))
      }
      else if(Int((numberField.text)!) == nil ||
        Int((numberField.text)!)! < 5 ||
        Int((numberField.text)!)! > 10){
        
          self.displayAlertErrorWithMessage(message: NSLocalizedString("INVALIDATEDNUMBER", comment: ""))
      }
      else{
        var city = nameField.text?.lowercased()
        if(city?.elementsEqual("londres") == true){
            city = "london"
        }
        ParametersManager.sharedInstance.changeParameters(city: city!, number: Int((numberField.text)!)!)
        
        self.loadWeather()
      }
      
    }))
    
    self.present(alert, animated: true)
  }
  
  func displayAlertErrorWithMessage(message: String){
    
    let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { action in
      
      self.displayParameterAlert()
      
    }))
    
    self.present(alert, animated: true)
  }
  
}
