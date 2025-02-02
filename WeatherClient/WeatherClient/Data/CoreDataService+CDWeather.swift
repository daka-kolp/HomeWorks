//
//  Untitled.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 02.02.2025.
//

import CoreData

extension CoreDataService {
    func insertWeather(weather: Weather) -> CDWeather {
        let cdWeather = CDWeather(context: context)
        saveCDWeather(cdWeather: cdWeather, weather: weather)
        return cdWeather
    }
    
    func updateWeather(weather: Weather) -> CDWeather? {
        guard let fetchedWeather = fetchWeather(name: weather.name) else { return nil }
        saveCDWeather(cdWeather: fetchedWeather, weather: weather)
        return fetchedWeather
    }
    
    
    func deleteWeather(name: String) {
        let fetchRequest: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        deleteRecords(CDWeather.self, fetchRequest: fetchRequest)
    }
    
    func fetchWeather(name: String) -> CDWeather? {
        let fetchRequest: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        
        let result = fetchDataFromEntity(CDWeather.self, fetchRequest: fetchRequest)
        return result.first
    }
    
    func fetchAllWeather() -> [CDWeather] {
        let fetchRequest: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        return fetchDataFromEntity(CDWeather.self, fetchRequest: fetchRequest)
    }
    
    private func saveCDWeather(cdWeather: CDWeather, weather: Weather) {
        cdWeather.id = Int32(weather.id)
        cdWeather.name = weather.name
        cdWeather.dateTime = Date.now
        cdWeather.humidity = weather.humidity
        cdWeather.pressure = weather.pressure
        cdWeather.temperature = weather.temperature
        cdWeather.wind = weather.windDesc
        
        let weatherSet = NSMutableSet()
        
        for details in weather.weather {
            let cdDescription = CDWeatherDescription(context: context)
            cdDescription.id = Int32(details.id)
            cdDescription.title = details.main
            cdDescription.desc = details.description
            
            weatherSet.add(cdDescription)
        }
        
        cdWeather.weatherDescriptions = weatherSet
        
        save(context: context)
    }
}
