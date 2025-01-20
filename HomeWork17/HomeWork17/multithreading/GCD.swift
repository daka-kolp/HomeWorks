//
//  GCD.swift (grand central dispatch)
//  HomeWork17
//
//  Created by Daria Kolpakova on 20.01.2025.
//

/* QoS:
 - User-interactive
 - User-initiated
 - Utility
 - Background
 */
import Foundation


func executeGCD(onLoading: @escaping () -> Void, onResult: @escaping () -> Void) {

    onLoading()
    
    let group = DispatchGroup()
    
    group.enter()
    DispatchQueue.global(qos: .userInteractive).async {
        for i in 1...10000 {
            print("userInteractive: \(i) ")
        }
        group.leave()
    }
    
    group.enter()
    DispatchQueue.global(qos: .userInitiated).async {
        for i in 1...10000 {
            print("userInitiated: \(i) ")
        }
        group.leave()
    }
    
    group.enter()
    DispatchQueue.global(qos: .utility).async {
        for i in 1...10000 {
            print("utility: \(i) ")
        }
        group.leave()
    }
    
    group.enter()
    DispatchQueue.global(qos: .background).async {
        for i in 1...10000 {
            print("background: \(i) ")
        }
        group.leave()
    }
    
    group.notify(queue: .main) {
        onResult()
    }
}

