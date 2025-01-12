//
//  ViewController.swift
//  HomeWork14
//
//  Created by Daria Kolpakova on 06.01.2025.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var mainView: MainView!
    var model: MainModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialState()
    }
    
    private func setupInitialState() {
        model = MainModel()
        model.delegate = self
        mainView.delegate = self
    }
}

extension MainViewController: MainModelDelegate {
    func dataDidLoad() {
        mainView.updateText(model.productsInfo)
    }
}

extension MainViewController: MainViewDelegate {
    func loadProductsByIds(ids: [Int]) {
        model.loadProductsByIds(ids: ids)
    }
    
    func loadProductById(id: Int) {
        model.loadProductById(id: id)
    }
}
