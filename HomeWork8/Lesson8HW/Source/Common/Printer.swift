//
//  Logger.swift
//  Lesson8HW
//

//

import Foundation
import UIKit

class Printer {
    weak var delegate: TextPrintDelegate?
    
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
        
        if let textToPrint = delegate?.textToPrint() {
            print("\(textToPrint) \(secondsText)")
        }
        
        seconds += 1
    }
}

protocol TextPrintDelegate: UIViewController  {
    func textToPrint() -> String
}
