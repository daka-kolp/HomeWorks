//
//  PackageTest.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 16.02.2025.
//

import SwiftUI
import Lottie

struct LottieTestView: View {
    
    var body: some View {
        LottieView(animation: .named("LottieAnimationTest")).playing()
        .padding(16.0)
    }    
}
