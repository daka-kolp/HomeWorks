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
            WeatherForecastModel(date: Date.from(2025, 02, 01), temperature: 10, pressure: 1040, humidity: 70),
            WeatherForecastModel(date: Date.from(2025, 02, 02), temperature: 11, pressure: 1041, humidity: 20),
            WeatherForecastModel(date: Date.from(2025, 02, 03), temperature: 8, pressure: 1038, humidity: 10),
            WeatherForecastModel(date: Date.from(2025, 02, 04), temperature: -5, pressure: 1035, humidity: 60),
            WeatherForecastModel(date: Date.from(2025, 02, 05), temperature: -1, pressure: 1039, humidity: 80),
            WeatherForecastModel(date: Date.from(2025, 02, 06), temperature: 4, pressure: 1042, humidity: 40),
            WeatherForecastModel(date: Date.from(2025, 02, 07), temperature: 7, pressure: 1036, humidity: 50)
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

extension Date {
    static func from(_ year: Int, _ month: Int, _ day: Int) -> Date
    {
        let gregorianCalendar = Calendar(identifier: .gregorian)
        let dateComponents = DateComponents(calendar: gregorianCalendar, year: year, month: month, day: day)
        return gregorianCalendar.date(from: dateComponents)!
    }
}
