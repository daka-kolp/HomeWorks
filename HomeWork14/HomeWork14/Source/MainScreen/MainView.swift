//
//  MainView.swift
//  HomeWork14
//
//  Created by Daria Kolpakova on 12.01.2025.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func loadProductsByIds(ids: [Int])
    
    func loadProductById(id: Int)
}

class MainView: UIView {
    weak var delegate: MainViewDelegate?
    
    @IBOutlet weak var txt: UITextView!
    

    func updateText(_ text: String) {
        txt.text = text
    }
    
    @IBAction func getThreeProducts(_ sender: UIButton) {
        delegate?.loadProductsByIds(ids: [3, 5, 10])
    }

    @IBAction func getOneProduct(_ sender: UIButton) {
        delegate?.loadProductById(id: 7)
    }
}
