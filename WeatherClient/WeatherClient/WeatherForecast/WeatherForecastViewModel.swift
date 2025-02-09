//
//  WeatherForecastViewModel.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 09.02.2025.
//

import Foundation

@MainActor
class WeatherForecastViewModel: ObservableObject {
    private let repo: WeatherRepo
    
    init(repo: WeatherRepo = WeatherRepo()) {
        self.repo = repo
    }
    
    @Published var forecast: [WeatherForecastModel] = []
    
    func fetchWeatherFor7Days() {
        forecast = [
            WeatherForecastModel(temperature: 10, pressure: 1040, humidity: 70),
            WeatherForecastModel(temperature: 11, pressure: 1041, humidity: 20),
            WeatherForecastModel(temperature: 8, pressure: 1038, humidity: 10),
            WeatherForecastModel(temperature: -5, pressure: 1035, humidity: 60),
            WeatherForecastModel(temperature: -1, pressure: 1039, humidity: 80),
            WeatherForecastModel(temperature: 4, pressure: 1042, humidity: 40),
            WeatherForecastModel(temperature: 7, pressure: 1036, humidity: 50)
        ]
    }
    
    var temperature: [Double] {
        get {
            return forecast.map { $0.temperature }
        }
    }
    
    var pressure: [Double] {
        get {
            return forecast.map { $0.pressure }
        }
    }
    
    var humidity: [Double] {
        get {
            return forecast.map { $0.humidity }
        }
    }
}
