//
//  PackageTest.swift
//  WeatherClient
//
//  Created by Daria Kolpakova on 16.02.2025.
//

import SwiftUI
import Lottie

struct LottieTestView: View {
    private let lottie = LottieView(animation: .named("LottieAnimationTest"))
    
    var body: some View {
        lottie.playing(loopMode: .loop).padding(16.0)
    }
}
