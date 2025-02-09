//
//  LineChartView.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 09.02.2025.
//

import SwiftUI

struct LineChartView: View {
    let values: [Double]
    
    var data: [Double] {
        return values.listOfPositiveValues
    }
    
    var body: some View {
        Canvas { context, size in
            guard !data.isEmpty else { return }
            
            var path = Path()
            let stepX = size.width / CGFloat(data.count - 1)
            
            let height = size.height
            
            let maxDataValue = data.max() ?? 1
            let scaleFactor = height / maxDataValue
            
            for (index, value) in data.enumerated() {
                
                let x = CGFloat(index) * stepX
                let y = height - (value  * scaleFactor)
                
                if index == 0 {
                    path.move(to: CGPoint(x: x, y: y))
                } else {
                    path.addLine(to: CGPoint(x: x, y: y))
                }
            }
            
            context.stroke(path, with: .color(.teal), lineWidth: 1.5)
        }
        .frame(width: 300, height: 300)
    }
}
