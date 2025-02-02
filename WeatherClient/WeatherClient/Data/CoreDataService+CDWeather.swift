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
        guard let cdWeather = fetchWeather(name: weather.name) else { return nil }
        
        deleteRelatedWeatherDescriptions(cdWeather)
        
        saveCDWeather(cdWeather: cdWeather, weather: weather)
        return cdWeather
    }
    
    func fetchWeather(name: String) -> CDWeather? {
        let result = fetchDataFromEntity(CDWeather.self, fetchRequest: weatherFetchRequest(name))
        return result.first
    }
    
    func deleteWeather(name: String) {
        let cdWeather = fetchWeather(name: name)
        guard let cdWeather = cdWeather else { return }
        
        deleteRelatedWeatherDescriptions(cdWeather)
        
        deleteRecords(CDWeather.self, fetchRequest: weatherFetchRequest(name))
    }
    
    func fetchAllWeather() -> [CDWeather] {
        let fetchRequest: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        return fetchDataFromEntity(CDWeather.self, fetchRequest: fetchRequest)
    }

    private func deleteRelatedWeatherDescriptions(_ cdWeather: CDWeather) {
        for d in cdWeather.weatherDescriptions ?? [] {
            guard let value = d as? CDWeatherDescription else { continue }
            let fetchRequest: NSFetchRequest<CDWeatherDescription> = CDWeatherDescription.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "id == %d", value.id)
            deleteRecords(CDWeatherDescription.self, fetchRequest: fetchRequest)
        }
    }
    
    private func weatherFetchRequest(_ name: String) -> NSFetchRequest<CDWeather>{
        let fetchRequest: NSFetchRequest<CDWeather> = CDWeather.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        return fetchRequest
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
