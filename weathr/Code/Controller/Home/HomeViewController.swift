//
//  HomeViewController.swift
//  weathr
//
//  Created by Smart&Soft on 01/03/2016.
//  Copyright © 2016 Smart&Soft. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "WeathR"
    WeathR.applyTheme(self.navigationController?.navigationBar)
  }
  
  //MARK: Action
  @IBAction func showAboutAction(_ sender: AnyObject) {
    let storyboard = UIStoryboard(name: "About", bundle: nil)
    let controller = storyboard.instantiateInitialViewController()
    self.present(controller!, animated: true, completion: nil)
  }
  
}
