//
//  WeatherFormView.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 26.01.2025.
//

import SwiftUI

struct WeatheerFormView: View {
    
    @StateObject private var weatherViewModel = WeatherFormViewModel()
    
    @State private var cityName = ""
    
    var body: some View {
        VStack {
            TextField("City", text: $cityName)
            Spacer().frame(height: 16.0)
            Text(weatherViewModel.stateToString)
            Spacer().frame(height: 16.0)
            Text(weatherViewModel.weatherInfo).multilineTextAlignment(.center)
            Spacer().frame(height: 32.0)
            Button("Get Weather Data") { getWeather() }
        }
        .padding(16.0)
        .onAppear() { deleteOldRecords() }
    }
    
    private func getWeather() {
        Task { await weatherViewModel.fetchWeather(cityName) }
    }
    
    private func deleteOldRecords() {
        weatherViewModel.deleteOldRecords()
    }
}
