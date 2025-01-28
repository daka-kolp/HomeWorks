//
//  WeatherRepo.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 26.01.2025.
//


import Foundation

actor WeathwrService {
    let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    let appId = "efdcbde173beba5f5a0267197d2393c0"
    let units = "metric"
    
    func fetchWeather(city: String) async -> Result<WeatherModel, Error> {
        let paramString = "q=\(city)&appid=\(appId)&units=\(units)"
        let urlString = baseUrl + "?\(paramString)"
        return await fetchWeather(urlString: urlString)
    }
    
    func fetchWeather(lat: Double, long: Double) async -> Result<WeatherModel, Error> {
        let paramString = "lat=\(lat)&lon=\(long)&appid=\(appId)&units=\(units)"
        let urlString = baseUrl + "?\(paramString)"
        return await fetchWeather(urlString: urlString)
    }
    
    
    private func fetchWeather(urlString: String) async -> Result<WeatherModel, Error> {
        guard let url = URL(string: urlString) else {
            return .failure(NSError(domain: "Url is invalid",  code: -1, userInfo: nil))
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        return await perfotmRequest(urlRequest: urlRequest, responceType: WeatherModel.self)
    }
    
    private func perfotmRequest<T: Decodable>(
        urlRequest: URLRequest,
        responceType: T.Type
    ) async -> Result<T, Error> {
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                return .failure(NSError(domain: "Invalid response, check params", code: -1, userInfo: nil))
            }
            let result  = try JSONDecoder().decode(T.self, from: data)
            return .success(result)
        } catch {
            return .failure(error)
        }
    }
}
