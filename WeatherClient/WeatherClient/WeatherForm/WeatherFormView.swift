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
    @State private var latitude = ""
    @State private var longitude = ""
    @State private var type = 0
    
    var body: some View {
        VStack {
            TextField("City", text: $cityName)
            Spacer().frame(height: 16.0)
            TextField("Lat", text: $latitude).keyboardType(.numbersAndPunctuation)
            TextField("Long", text: $longitude).keyboardType(.numbersAndPunctuation)
            Spacer().frame(height: 16.0)
            Picker(selection: $type, label: Text("Request Type")) {
                Text("City").tag(0)
                Text("Coordinates").tag(1)
            }.pickerStyle(SegmentedPickerStyle())
            Spacer().frame(height: 16.0)
            Button("Get Weather Data") { getWeather() }
            
            Spacer().frame(height: 32.0)
            Text(weatherViewModel.stateToString)
        }
        .padding()
    }
    
    private func getWeather() {
        Task {
            switch(type) {
            case 0:
                await weatherViewModel.fetchWeather(by: cityName)
            case 1:
                await weatherViewModel.fetchWeather(
                    lat: Double(latitude)!,
                    long: Double(longitude)!
                )
            default:
                print("No Option Selected")
            }
        }
    }
}
