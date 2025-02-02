//
//  Untitled.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 02.02.2025.
//

import CoreData

extension CoreDataService {
    
    func createWeather(weather: Weather) -> CDWeather? {
        let weatherEntity = NSEntityDescription.entity(forEntityName: "CDWeather", in: context)!
        let weatherManagedObjectModel = NSManagedObject(entity: weatherEntity, insertInto: context)
        
        weatherManagedObjectModel.setValue(weather.id, forKey: "id")
        weatherManagedObjectModel.setValue(weather.name, forKey: "name")
        weatherManagedObjectModel.setValue(weather.temperature, forKey: "temperature")
        weatherManagedObjectModel.setValue(weather.pressure, forKey: "pressure")
        weatherManagedObjectModel.setValue(weather.humidity, forKey: "humidity")
        weatherManagedObjectModel.setValue(weather.windDesc, forKey: "wind")
        weatherManagedObjectModel.setValue(Date.now, forKey: "dateTime")
        
        let set = NSMutableSet()
        
        for desc in weather.weather {
            let descEntity = NSEntityDescription.entity(forEntityName: "CDWeatherDescription", in: context)!
            let descManagedObjectModel = NSManagedObject(entity: descEntity, insertInto: context)
            
            descManagedObjectModel.setValue(desc.id, forKey: "id")
            descManagedObjectModel.setValue(desc.main, forKey: "title")
            descManagedObjectModel.setValue(desc.description, forKey: "desc")
            
            set.add(descManagedObjectModel)
        }
        
        let weatherModel = weatherManagedObjectModel as? CDWeather
        
        weatherModel?.addToWeatherDescriptions(set)
        
        do {
            try context.save()
        } catch let error {
            assertionFailure()
            debugPrint(error.localizedDescription)
        }
        
        return weatherModel
    }
}
