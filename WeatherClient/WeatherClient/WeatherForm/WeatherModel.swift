//
//  WeatherModel.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 27.01.2025.
//

import Foundation

class WeatherModel {
    var dateTime: Date
    var name: String
    var temperature: String
    var pressure: String
    var humidity: String
    var weatherDesc: String
    var windDesc: String
    
    init(
        dateTime: Date,
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

    init (fromNetworkData entity: Weather) {
        self.dateTime = Date()
        self.name = entity.name
        self.temperature = entity.temperature
        self.pressure = entity.pressure
        self.humidity = entity.humidity
        self.weatherDesc = entity.weatherDesc
        self.windDesc = entity.windDesc
    }
    
    init (fromFileData fileData: WeatherFileData) {
        self.dateTime = fileData.dateTime
        self.name = fileData.name
        self.temperature = fileData.temperature
        self.pressure = fileData.pressure
        self.humidity = fileData.humidity
        self.weatherDesc = fileData.weatherDesc
        self.windDesc = fileData.windDesc
    }
    
    func toString() -> String {
        return "\(name)\n\n\(temperature)\n\(pressure)\n\(humidity)\n\(weatherDesc)\n\(windDesc)"
    }
}
