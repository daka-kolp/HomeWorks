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
    
    @Published var state: WeatherState = .initial
    private let service = WeathwrService()
    
    func fetchWeather(by cityName: String) async {
        self.state = .loading
        
        let result = await service.fetchWeather(city: cityName)
        switch result {
        case .success (let weather):
            self.state = .loaded(weather)
        case .failure (let error):
            self.state = .error(error)
        }
    }
    
    
    func fetchWeather(lat: Double, long: Double) async {
        self.state = .loading
        
        let result = await service.fetchWeather(lat: lat, long: long)
        switch result {
        case .success (let weather):
            self.state = .loaded(weather)
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
