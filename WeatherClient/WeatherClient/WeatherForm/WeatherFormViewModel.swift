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
    
    func fetchWeather(cityName: String) async {
        self.state = .loading
        
        let result = await repo.loadWeather(city: cityName)
        
        switch result {
        case .success (let weather):
            self.state = .loaded(weather)
        case .failure (let error):
            self.state = .error(error.localizedDescription)
        }
    }
    
    func fetchWeather(lat: Double, long: Double) async {
        self.state = .loading
        
        let result = await repo.loadWeather(lat: lat, long: long)
        
        switch result {
        case .success (let weather):
            self.state = .loaded(weather)
        case .failure (let error):
            self.state = .error(error.localizedDescription)
        }
    }
    
    
    func deleteOldRecords() {
        repo.deleteOldRecords()
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
