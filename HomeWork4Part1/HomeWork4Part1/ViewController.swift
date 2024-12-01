//
//  ViewController.swift
//  HomeWork4Part1
//
//  Created by Daria Kolpakova on 01.12.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "Hello"
    }

    @IBAction func onButtonClicked(_ sender: Any) {
        label.text = "Bye"
    }
}

