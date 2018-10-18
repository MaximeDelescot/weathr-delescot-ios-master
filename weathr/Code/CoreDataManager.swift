//
//  CoreDataManager.swift
//  weathr
//
//  Created by Maxime Delescot on 18/10/2018.
//  Copyright © 2018 Smart&Soft. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    public static let sharedInstance = CoreDataManager()

    func saveWeathers(weatherArray: Array<Weather>) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        for weather in weatherArray{
            
            let entity = NSEntityDescription.entity(forEntityName: "WeatherEntities", in: context)!
            let managedObject = NSManagedObject(entity: entity, insertInto: context)
            
            managedObject.setValue(weather.date, forKeyPath: "date")
            managedObject.setValue(weather.temperatureMax, forKeyPath: "tempMax")
            managedObject.setValue(weather.temperatureMin, forKeyPath: "tempMin")
            managedObject.setValue(weather.type, forKeyPath: "type")
            managedObject.setValue(weather.windSpeed, forKeyPath: "windSpe")
            managedObject.setValue(weather.windDirection, forKeyPath: "windDir")
            managedObject.setValue(weather.uvIndex, forKeyPath: "uv")

            do {
                try context.save()                
            } catch let error as NSError {
                //error
            }

        }
    }
    
    func getWeathers() -> [Weather]? {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "WeatherEntities")
        request.returnsObjectsAsFaults = false
        var weatherArray = [Weather]()
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0
            {
                
                for result in results as! [NSManagedObject]
                {
                    let date = result.value(forKey: "date") as? NSDate
                    let type = result.value(forKey: "type") as? String
                    let tempMax = result.value(forKey: "tempMax") as? Int
                    let tempMin = result.value(forKey: "tempMin") as? Int
                    let uv = result.value(forKey: "uv") as? Int
                    let windSpe = result.value(forKey: "windSpe") as? Int
                    let windDir = result.value(forKey: "windDir") as? String

                    let weather = Weather(date: date!, tempMin: tempMin!, tempMax: tempMax!, type: type!, uvInd: uv!, windDir: windDir!, windSpeed: windSpe!)
                    
                    weatherArray.append(weather)
                }
                
                
            }
            return weatherArray
            
        } catch let error as NSError {
            //error
        }
        
        return nil
        
    }
    
    func deleteAllData(entity: String)
    {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        fetchRequest.includesPropertyValues = false
        
        do {
            let items = try context.fetch(fetchRequest) as! [NSManagedObject]
            
            for item in items {
                context.delete(item)
            }
            
            try context.save()

        } catch {
            //error
        }
    }
}
