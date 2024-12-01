//
//  Product.swift
//  HomeWork4Part2
//

//

import Foundation

class Product {
    
    var name: String
    var price: Double
    var currency: Currency
    var motherBoard: MotherBoard
    
    init(name: String, price: Double, currency: Currency, motherBoard: MotherBoard) {
        self.name = name
        self.price = price
        self.currency = currency
        self.motherBoard = motherBoard
    }
    
    func textDescription() -> String {
        
        let stringPrice = String(format: "%.2f", price)
        
        let firstLine = "Назва продукту: \(name)\nЦіна: \(currency.rawValue) \(stringPrice)"
        let secondLine = "Сокет: \(motherBoard.socet)\nПроцессор: \(motherBoard.processor.rawValue)"
        
        return firstLine + "\n" + secondLine
    }
}
