//
//  YellowViewController.swift
//  Lesson8HW
//

//

import UIKit

class YellowViewController: UIViewController {
    
    var printer: Printer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setup()
    }
    
    func textToPrint() -> String {
        return "🚖 - жовте таксі у дорозі"
    }
}

//MARK: - Private
private extension YellowViewController {
    
    func setupUI() {
        view.backgroundColor = .lightYellow
        
        let taxiLabel = UILabel()
        taxiLabel.text = "🚖"
        taxiLabel.font = .systemFont(ofSize: 200.0)
        
        view.addSubview(taxiLabel)
        
        taxiLabel.translatesAutoresizingMaskIntoConstraints = false
        taxiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        taxiLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setup() {
        
        printer = Printer()
        printer.yellowViewController = self
        
        printer.startPrinting()
    }
}
