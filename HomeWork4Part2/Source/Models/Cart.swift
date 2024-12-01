//
//  Cart.swift
//  HomeWork4Part2
//

//

import Foundation

class Cart {
    
    var products: [Product] = []
    var discount: Discount = .none
    
    func removeSelectedProduct(at index: Int) {
        products.remove(at: index)
    }
    
    func clear() {
        for index in 0 ... products.count {
            products.remove(at: index)
        }
    }
    
    func totalPrice() -> Double {
        var resultPrice: Double = 0.0
        for product in products {
            resultPrice += product.price
        }
        return resultPrice
    }
    
    func discountPercentValue() -> Int {
        switch discount {
        case .regular:
            return 5
        case .vip:
            return 15
        case .none:
            return 0
        }
    }
    
    func totalPriceWithDiscount() -> Double {
        let price = totalPrice()
        let result = price - (price * (Double(discountPercentValue()) / 100.0) )
        
        return result
    }
}
