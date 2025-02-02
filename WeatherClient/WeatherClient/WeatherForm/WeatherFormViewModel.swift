//
//  WeatherFormViewModel.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 26.01.2025.
//

import Foundation

enum WeatherState {
    case initial
    case loading
    case loaded(WeatherModel)
    case error(String)
}

@MainActor
class WeatherFormViewModel: ObservableObject {
    private let repo: WeatherRepo
    
    init(repo: WeatherRepo = WeatherRepo()) {
        self.repo = repo
    }
    
    @Published var state: WeatherState = .initial
    @Published var weatherInfo: String = ""
    
    func fetchWeather(_ cityName: String) async {
        self.state = .loading
        
        guard let weatherCoreData = repo.loadCDWeather(name: cityName) else {
            await saveWeather(cityName, infoOnSuccess: "weather was not exist, saved")
            return
        }
        
        let weatherModel = WeatherModel.init(fromCoreData: weatherCoreData)
        
        let savedDateTime = weatherModel.dateTime
        let updateDateTime = Calendar.current.date(byAdding: .hour, value: 3, to: savedDateTime)!
        
        if (updateDateTime < Date.now) {
            await saveWeather(cityName, infoOnSuccess: "weather has been just updated")
        } else {
            self.state = .loaded(weatherModel)
            weatherInfo = "weather is already saved, next available update: \(updateDateTime.formatted())"
        }
    }
    
    private func saveWeather(_ cityName: String, infoOnSuccess: String) async {
        let result = await repo.fetchWeather(city: cityName)
        
        switch result {
        case .success (let weather):
            let weather = repo.saveCDWeather(data: weather)
            self.state = .loaded(WeatherModel.init(fromCoreData: weather))
            weatherInfo = infoOnSuccess
        case .failure (let error):
            self.state = .error(error.localizedDescription)
            weatherInfo = ""
        }
    }
    
    func deleteOldRecords() {
        let weatherList = repo.loadAllCDWeather()
        
        for weather in weatherList {
            guard let savedDateTime = weather.dateTime else { continue }
            let updateDateTime = Calendar.current.date(byAdding: .hour, value: 3, to: savedDateTime)!
            if (updateDateTime < Date.now) {
                guard let name = weather.name else { continue }
                repo.deleteCDWeather(name: name)
            }
        }
    }
    
    var stateToString: String {
        get {
            switch(state) {
            case .loading:
                return "Loading..."
            case .loaded(let model):
                return model.toString()
            case .error(let e):
                return "\(e)"
            default:
                return ""
            }
        }
    }
}
