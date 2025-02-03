//
//  WeatherRepo+ViewModel.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 03.02.2025.
//

import Foundation

extension WeatherRepo {
    
    func loadWeather(city: String) async -> Result<WeatherModel, Error> {
        guard let weatherCoreData = loadCDWeather(city: city) else {
            return await saveWeather("weather was not exist, saved") {
                return await fetchWeather(city: city)
            }
        }
        
        let weatherModel = WeatherModel.init(fromCoreData: weatherCoreData)
        
        let savedDateTime = weatherModel.dateTime
        guard let updateDateTime = getUpdateDataTime(date: savedDateTime) else {
            return .failure(NSError())
        }
        
        if (updateDateTime < Date.now) {
            return await saveWeather("weather has been just updated") {
                return await fetchWeather(city: city)
            }
        } else {
            print("weather is already saved, next available update: \(updateDateTime.formatted())")
            return .success(weatherModel)
        }
    }
    
    func loadWeather(lat: Double, long: Double) async -> Result<WeatherModel, Error> {
        guard let weatherCoreData = loadCDWeather(lat: lat, long: long) else {
            return await saveWeather("weather was not exist, saved") {
                return await fetchWeather(lat: lat, long: long)
            }
        }
        
        let weatherModel = WeatherModel.init(fromCoreData: weatherCoreData)
        
        let savedDateTime = weatherModel.dateTime
        guard let updateDateTime = getUpdateDataTime(date: savedDateTime) else {
            return .failure(NSError())
        }
        
        if (updateDateTime < Date.now) {
            return await saveWeather("weather has been just updated") {
                return await fetchWeather(lat: lat, long: long)
            }
        } else {
            print("weather is already saved, next available update: \(updateDateTime.formatted())")
            return .success(weatherModel)
        }
    }
    
    private func saveWeather(
        _ status: String,
        fetchWeather: () async -> Result<Weather, Error>
    ) async -> Result<WeatherModel, Error>{
        let result = await fetchWeather()
        
        switch result {
        case .success (let weather):
            let weather = saveCDWeather(data: weather)
            print(status)
            return .success(WeatherModel.init(fromCoreData: weather))
        case .failure (let error):
            return .failure(error)
        }
    }
    
    
    func deleteOldRecords() {
        let weatherList = loadAllCDWeather()
        
        for weather in weatherList {
            guard let savedDateTime = weather.dateTime else { continue }
            guard let updateDateTime = getUpdateDataTime(date: savedDateTime) else { continue }
            if (updateDateTime < Date.now) {
                guard let coordinates = weather.coordinates else { continue }
                deleteCDWeather(coordinates: coordinates)
            }
        }
    }
    
    private func getUpdateDataTime(date: Date) -> Date?  {
        return Calendar.current.date(byAdding: .hour, value: 3, to: date)
    }
}
