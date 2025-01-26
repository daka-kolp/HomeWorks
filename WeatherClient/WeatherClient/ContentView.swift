//
//  ContentView.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 25.01.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var cityName = ""
    @State private var latitude = ""
    @State private var longitude = ""
    @State private var isCity = true
    
    var body: some View {
        VStack {
            TextField("City", text: $cityName)
            Spacer().frame(height: 16.0)
            TextField("Lat", text: $latitude).keyboardType(.numbersAndPunctuation)
            TextField("Long", text: $longitude).keyboardType(.numbersAndPunctuation)
            Spacer().frame(height: 16.0)
            Toggle("By city (true) / By coordinates (false)", isOn: $isCity)
            Spacer().frame(height: 16.0)
            Button("Get Weather Data") {
                //TODO: send request
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
