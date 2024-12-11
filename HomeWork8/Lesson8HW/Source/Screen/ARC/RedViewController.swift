//
//  RedViewController.swift
//  Lesson8HW
//

//

import UIKit

class RedViewController: UIViewController {
    
    var printer: Printer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setup()
    }
    
    func textToPrint() -> String {
        return "🚗 - червоне таксі у дорозі"
    }
}

//MARK: - Private
private extension RedViewController {
    
    func setupUI() {
        view.backgroundColor = .lightRed
        
        let taxiLabel = UILabel()
        taxiLabel.text = "🚗"
        taxiLabel.font = .systemFont(ofSize: 200.0)
        
        view.addSubview(taxiLabel)
        
        taxiLabel.translatesAutoresizingMaskIntoConstraints = false
        taxiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taxiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setup() {
        
        printer = Printer()
        printer.redViewController = self
        
        printer.startPrinting()
    }
}
