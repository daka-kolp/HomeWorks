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
    
    init (fromCoreData coreData: CDWeather) {
        self.dateTime = coreData.dateTime ?? Date.now
        self.name = coreData.name ?? ""
        self.temperature = coreData.temperature ?? ""
        self.pressure = coreData.pressure ?? ""
        self.humidity = coreData.humidity ?? ""
        self.weatherDesc = coreData.weatherDescriptions?.map {($0 as? CDWeatherDescription)?.desc ?? ""}.joined(separator: ", ") ?? ""
        self.windDesc = coreData.wind ?? ""
    }
    
    func toString() -> String {
        return "\(name)\n\n\(temperature)\n\(pressure)\n\(humidity)\n\(weatherDesc)\n\(windDesc)"
    }
}
