//
//  MainModel.swift
//  HomeWork14
//
//  Created by Daria Kolpakova on 12.01.2025.
//

import Foundation

protocol MainModelDelegate: AnyObject {
    func dataDidLoad()
}

class MainModel {
    weak var delegate: MainModelDelegate?
    
    var productsInfo: String = ""
    
    func loadThreeProduct(ids: [Int]) {
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.productsInfo = "Loading..."
                self.delegate?.dataDidLoad()
            }
            
            NetworkService.instance.fetchProductsByIds(
                ids: ids,
                completion: { result in
                    let productsToString = result.map { $0.toString() }
                    DispatchQueue.main.async {
                        self.productsInfo = productsToString.joined(separator: "\n\n")
                        self.delegate?.dataDidLoad()
                    }
                },
                completionError: { error in
                    DispatchQueue.main.async {
                        self.productsInfo = "Error: \(error)"
                        self.delegate?.dataDidLoad()
                    }
                }
            )
        }
    }
    
    
    func loadProductById(id: Int) {
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self else { return }
            
            DispatchQueue.main.async {
                self.productsInfo = "Loading..."
                self.delegate?.dataDidLoad()
            }
            
            NetworkService.instance.fetchProductById(
                id: id,
                completion: { result in
                    DispatchQueue.main.async {
                        self.productsInfo = result.toString()
                        self.delegate?.dataDidLoad()
                    }
                },
                completionError: { error in
                    DispatchQueue.main.async {
                        self.productsInfo = "Error: \(error)"
                        self.delegate?.dataDidLoad()
                    }
                }
            )
        }
    }
}
