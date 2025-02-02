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
    case error(Error)
}

@MainActor
class WeatherFormViewModel: ObservableObject {
    private let repo: WeatherRepo
    
    private let cityName = "Kyiv"
    
    init(repo: WeatherRepo = WeatherRepo()) {
        self.repo = repo
    }
    
    @Published var state: WeatherState = .initial
    @Published var weatherInfo: String = ""
    
    
    func fetchWeather() async {
        self.state = .loading
        
        guard let weatherFileData = try? repo.loadWeather() else {
            await saveWeather()
            weatherInfo = "weather was not exist, saved"
            return
        }
        
        let savedDateTime = weatherFileData.dateTime
        let updateDateTime = Calendar.current.date(byAdding: .hour, value: 3, to: savedDateTime)!
        
        if (updateDateTime < Date.now) {
            await saveWeather()
            weatherInfo = "weather has been just updated"
        } else {
            self.state = .loaded(WeatherModel.init(fromFileData: weatherFileData))
            weatherInfo = "weather is already saved, next available update: \(updateDateTime.formatted())"
        }
        
    }
    
    private func saveWeather() async {
        let result = await repo.fetchWeather(city: cityName)
        
        switch result {
        case .success (let weather):
            do {
                try repo.saveWeather(data: weather)
                
                //Результат на екрані має завжди виводитися з файлової системи
                let weatherFileData = try repo.loadWeather()
                
                self.state = .loaded(WeatherModel.init(fromFileData: weatherFileData))
            } catch {
                self.state = .error(error)
            }
        case .failure (let error):
            self.state = .error(error)
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
