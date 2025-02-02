//
//  WeatherRepo.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 26.01.2025.
//

import Foundation

class WeatherRepo {
    private let coreDataService: CoreDataService
    private let networkService: NetworkServiceProtocol
    
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    private let appId = "efdcbde173beba5f5a0267197d2393c0"
    private let units = "metric"
    
    init() {
        self.networkService = NetworkService()
        self.coreDataService = CoreDataService()
    }
    
    func fetchWeather(city: String) async -> Result<Weather, Error> {
        let paramString = "q=\(city)&appid=\(appId)&units=\(units)"
        let urlString = baseUrl + "?\(paramString)"
        return await fetchWeather(urlString: urlString)
    }
    
    func fetchWeather(lat: Double, long: Double) async -> Result<Weather, Error> {
        let paramString = "lat=\(lat)&lon=\(long)&appid=\(appId)&units=\(units)"
        let urlString = baseUrl + "?\(paramString)"
        return await fetchWeather(urlString: urlString)
    }
    
    func saveCDWeather(data: Weather) -> CDWeather {
        guard let weather = coreDataService.updateWeather(weather: data) else {
            return coreDataService.insertWeather(weather: data)
        }
        return weather
    }
    
    func loadCDWeather(name: String) -> CDWeather? {
        return coreDataService.fetchWeather(name: name)
    }
    
    func deleteCDWeather(name: String) {
        coreDataService.deleteWeather(name: name)
    }
    
    private func fetchWeather(urlString: String) async -> Result<Weather, Error> {
        return await networkService.request(
            endpoint: urlString,
            method: .GET,
            headers: nil,
            body: nil
        )
    }
}
