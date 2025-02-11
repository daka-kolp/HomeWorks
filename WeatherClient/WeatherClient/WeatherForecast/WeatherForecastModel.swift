//
//  WeatherModel.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 09.02.2025.
//

import Foundation

class WeatherForecastModel: Identifiable {
    var date: Date
    var temperature: Double
    var pressure: Double
    var humidity: Double
    
    init(
        date: Date,
        temperature: Double,
        pressure: Double,
        humidity: Double
    ) {
        self.date = date
        self.temperature = temperature
        self.pressure = pressure
        self.humidity = humidity
    }
}
