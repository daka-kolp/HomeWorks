//
//  WeatherForecastView.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 09.02.2025.
//

import SwiftUI

struct WeatherForecastView: View {
    @StateObject private var forecastViewModel = WeatherForecastViewModel()
    @State private var type = 0
    
    var body: some View {
        VStack {
            Picker(selection: $type, label: Text("Chart Type")) {
                Text("Line Chart").tag(0)
                Text("Bar Chart").tag(1)
                Text("Pie Chart").tag(2)
            }.pickerStyle(SegmentedPickerStyle())
            Spacer()
            switch type {
            case 0:
                LineChartView(values: forecastViewModel.temperature)
            case 1:
                BarChartView(values: forecastViewModel.temperature)
            case 2:
                PieChartView(values: forecastViewModel.temperature)
            default:
                Text("No chart")
            }
            Spacer()
        }
        .padding(16.0)
        .onAppear { forecastViewModel.fetchWeatherFor7Days() }
    }
}

extension [Double] {
    var listOfPositiveValues: [Double] {
        let minValue = self.min() ?? 0.0
        if(minValue < 0.0) {
            return map { $0 + abs(minValue) }
        }
        return map { $0 }
    }
}
