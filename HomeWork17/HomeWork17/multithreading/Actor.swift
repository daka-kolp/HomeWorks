//
//  Actor.swift
//  HomeWork17
//
//  Created by Daria Kolpakova on 20.01.2025.
//

import Foundation

@MainActor
class Actor: ObservableObject {
    private var actorExecutor = ActorExecutor()
    
    @Published var result: String = ""
    @Published var isActorActive: Bool = false
    
    func executeActor() async {
        do {
            self.result = "Actor logic in progress..."
            self.isActorActive = true
            try await actorExecutor.execute()
            self.result = "Actor logic is finished"
            self.isActorActive = false
        } catch {
            self.result = "Actor: something went wrong..."
            self.isActorActive = false
        }
    }
}

actor ActorExecutor {
    private var isActive: Bool = false
    
    func execute() async throws {
        if isActive { return }
        
        isActive = true
        var counter = 0
        while (counter < 15_000) {
            counter += 1
            try await Task.sleep(for: .microseconds(10))
        }
        
        isActive = false
    }
}
