//
//  Untitled.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 09.02.2025.
//

import SwiftUI

struct PieChartView: View {
    let values: [Double]
    
    var data: [Double] {
        return values.listOfPositiveValues
    }
    
    var body: some View {
        Canvas { context, rect in
            guard !data.isEmpty else { return }
            
            let total = data.reduce(0, +)
            guard total > 0 else { return }
            
            let centerPoint = CGPoint(x: rect.width/2, y: rect.height/2)
            
            let radius = min(rect.width, rect.height) / 2 - 10
            
            var startAngle: CGFloat = -.pi / 2
            
            for (index, value) in data.enumerated() {
                let angle = (value / total) * 2 * .pi
                let endAngle = startAngle + angle
                
                var path = Path()
                path.move(to: centerPoint)
                path.addArc(
                    center: centerPoint,
                    radius: radius,
                    startAngle: Angle(radians:endAngle),
                    endAngle: Angle(radians:startAngle),
                    clockwise: true
                )
                path.closeSubpath()
                
                context.fill(path,  with: .color(values[index] > 0 ? .red : .blue))
                
                startAngle = endAngle
            }
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
