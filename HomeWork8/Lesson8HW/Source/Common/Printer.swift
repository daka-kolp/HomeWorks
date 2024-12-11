//
//  Logger.swift
//  Lesson8HW
//

//

import Foundation

class Printer {
    
    var yellowViewController: YellowViewController?
    var blueViewController: BlueViewController?
    var redViewController: RedViewController?
    
    private var timer: Timer?
    private var seconds: Int = 0
    
    func startPrinting() {
        
        stop()
        
        timer = Timer.scheduledTimer(
            timeInterval: 1,
            target: self,
            selector: #selector(timerAction),
            userInfo: nil,
            repeats: true
        )
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    @objc private func timerAction() {
        
        let secondsText = "\(seconds) секунд"
        
        if let textToPrint = yellowViewController?.textToPrint() {
            print("\(textToPrint) \(secondsText)")
        }
        
        if let textToPrint = blueViewController?.textToPrint() {
            print("\(textToPrint) \(secondsText)")
        }
        
        if let textToPrint = redViewController?.textToPrint() {
            print("\(textToPrint) \(secondsText)")
        }
        
        seconds += 1
    }
}
