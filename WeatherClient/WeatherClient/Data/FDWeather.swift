//
//  WeatherFileData.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 27.01.2025.
//

import Foundation

struct FDWeather: Codable {
    let dateTime: Date
    let name: String
    let temperature: String
    let pressure: String
    let humidity: String
    let weatherDesc: String
    let windDesc: String

    init(
        dateTime: Date = Date(),
        name: String,
        temperature:  String,
        pressure:  String,
        humidity:  String,
        weatherDesc:  String,
        windDesc:  String
    ) {
        self.dateTime = dateTime
        self.name = name
        self.temperature = temperature
        self.pressure = pressure
        self.humidity = humidity
        self.weatherDesc = weatherDesc
        self.windDesc = windDesc
    }
    
    init(fromNetworkData weather: Weather) {
        self.dateTime = Date()
        self.name = weather.name
        self.temperature = weather.temperature
        self.pressure = weather.pressure
        self.humidity = weather.humidity
        self.weatherDesc = weather.weatherDesc
        self.windDesc = weather.windDesc
    }
}
