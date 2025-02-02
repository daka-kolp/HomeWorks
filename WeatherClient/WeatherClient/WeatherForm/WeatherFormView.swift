//
//  WeatherFormView.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 26.01.2025.
//

import SwiftUI

struct WeatheerFormView: View {
    
    @StateObject private var weatherViewModel = WeatherFormViewModel()
    
    var body: some View {
        VStack {
            Text(weatherViewModel.stateToString)
            Spacer().frame(height: 16.0)
            Text(weatherViewModel.weatherInfo).multilineTextAlignment(.center)
            Spacer().frame(height: 32.0)
            Button("Get Weather Data") { getWeather() }
        }
        .padding(16.0)
        .onAppear() { getWeather() }
    }
    
    private func getWeather() {
        Task { await weatherViewModel.fetchWeather() }
    }
}
