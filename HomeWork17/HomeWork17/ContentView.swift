//
//  ContentView.swift
//  HomeWork17
//
//  Created by Daria Kolpakova on 20.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var result: String = ""
    @State private var isGCDActive: Bool = false
    
    @StateObject private var actor = Actor()
    
    var body: some View {
        VStack {
            Button("GCD") { gcdAction() }.disabled(isGCDActive)
            Spacer().frame(height: 16.0)
            Button("Actor") { actorAction() }.disabled(actor.isActorActive)
            
            Spacer().frame(height: 32.0)
            
            Text(result)
            Spacer().frame(height: 16.0)
            Text(actor.result)
        }
        .padding()
    }
    
    private func gcdAction() {
        executeGCD(
            onLoading: {
                result = "GCD: Loading..."
                isGCDActive = true
            },
            onResult: {
                result = "GCD: All tasks finished"
                isGCDActive = false
            }
        )
    }
    
    private func actorAction() {
        Task { await actor.executeActor() }
    }
}

#Preview {
    ContentView()
}
