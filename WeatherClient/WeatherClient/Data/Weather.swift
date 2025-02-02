//
//  Weather.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 26.01.2025.
//

struct Weather: Decodable {
    let id: Int
    let name: String
    let main: WeatherParams
    let weather: [WeatherDescription]
    let wind: Wind
    
    
    var temperature: String {
        get { return "\(main.temp) C" }
    }
    
    var pressure: String {
        get { return "\(main.pressure) hPa" }
    }
    
    var humidity: String {
        get { return "\(main.humidity) %" }
    }
    
    var weatherDesc: String {
        get { return "\(weather.map {$0.description}.joined(separator: ", "))" }
    }
    
    var windDesc: String {
        get { return "\(wind.direction), \(wind.speed) m/s" }
    }
}

struct WeatherParams: Decodable {
    let temp: Double
    let pressure: Double
    let humidity: Double
}

struct WeatherDescription: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Wind: Decodable {
    let speed: Double
    let deg: Double
    let gust: Double?
    
    var direction: String {
        get {
            switch deg {
            case 0 ..< 22.25:
                return "North"
            case 22.25 ..< 67.5:
                return "Northeast"
            case 67.5 ..< 112.5:
                return "East"
            case 112.5 ..< 157.5:
                return "Southeast"
            case 157.5 ..< 202.5:
                return "South"
            case 202.5 ..< 247.5:
                return "Southwest"
            case 247.5 ..< 292.5:
                return "West"
            case 292.5 ..< 337.5:
                return "Northwest"
            default:
                return "North"
            }
        }
    }
}
