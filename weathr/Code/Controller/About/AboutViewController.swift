//
//  AboutViewController.swift
//  weathr
//
//  Created by Smart&Soft on 02/03/2016.
//  Copyright © 2016 Smart&Soft. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
  
  @IBOutlet weak var ibWebView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    WeathR.applyTheme(self.navigationController?.navigationBar)
    let filePath = Bundle.main.path(forResource: "about", ofType: "html")
    if let url = URL(string: filePath!) {
      let request = URLRequest(url: url)
      self.ibWebView.loadRequest(request)
    }
    
  }
  
  @IBAction func closeAction(_ sender: AnyObject) {
    self.dismiss(animated: true, completion: nil)
  }
  
}
