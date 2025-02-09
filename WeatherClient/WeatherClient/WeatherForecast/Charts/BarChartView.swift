//
//  BarChartView.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 09.02.2025.
//

import SwiftUI

struct BarChartView: View {
    let values: [Double]
    
    var data: [Double] {
        return values
    }
    
    var body: some View {
        Canvas { context, rect in
            guard !data.isEmpty else { return }
            
            let barWidth = rect.width / CGFloat(data.count)
            
            let maxDataValue = data.max() ?? 1
            let scaleFactor = rect.height / (maxDataValue * 2)
            
            for (index, value) in data.enumerated() {
                let barHeight = abs(value) * scaleFactor
                
                let x = CGFloat(index) * barWidth
                
                if (value > 0.0) {
                    let y = rect.height / 2.0 - barHeight
                    let rect = CGRect(
                        x: x,
                        y: y,
                        width: barWidth - 4.0,
                        height: barHeight
                    )
                    context.fill(Path(rect), with: .color(.teal))
                } else {
                    let rect = CGRect(
                        x: x,
                        y: rect.height / 2.0,
                        width: barWidth - 4.0,
                        height: barHeight
                    )
                    context.fill(Path(rect), with: .color(.teal))
                }
            }
        }
        .frame(width: 300, height: 300)
    }
}
