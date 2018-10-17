//
//  WebServiceManager.swift
//  weathr
//
//  Created by Maxime Delescot on 17/10/2018.
//  Copyright © 2018 Smart&Soft. All rights reserved.
//

import UIKit
import Alamofire

class WebServiceManager: NSObject {
    
    public static let sharedInstance = WebServiceManager()
    let urlDirectory = "https://smartnsoft.com/shared/weather/index.php?"
    
    
    func getDicoFromfile(fileName: String, completion: @escaping (NSDictionary?) -> Void) {
        
        let urlName = self.urlDirectory + fileName
        
        Alamofire.request(urlName, method: .get, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                if let dico = response.result.value as! NSDictionary? {
                    completion(dico)
                }
                
        }
        completion(nil)
    }
}
