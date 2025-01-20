//
//  ContentView.swift
//  HomeWork17
//
//  Created by Daria Kolpakova on 20.01.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("GCD") {}
            Spacer().frame(height: 16.0)
            Button("Actor") {}
            Spacer().frame(height: 32.0)
            Text("Result")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
