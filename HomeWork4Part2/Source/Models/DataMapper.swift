//
//  DataMapper.swift
//  HomeWork4Part2
//

//

import Foundation

class DataMapper {
    
    func products(from productInfoList: [ProductInfo]) -> [Product] {
        
        var productList = [Product]()
        
        for productInfo in productInfoList {
            let product = convertToProduct(from: productInfo)
            productList.append(product)
        }
        
        return productList.shuffled()
    }
    
    func convertToProduct(from productInfo: ProductInfo) -> Product {
        let motherBoard = MotherBoard(
            socet: productInfo.3,
            processor: ProcessorType(rawValue: productInfo.4) ?? .none
        )
        let product = Product(
            name: productInfo.0,
            price: productInfo.1,
            currency: Currency(rawValue: productInfo.2) ?? .uah,
            motherBoard: motherBoard
        )
        
        return product
    }
    
    func price(for product: Product, currency: Currency) -> Double {
        let usd = 36.57 // 1 долар коштує 36.57 грн.
        let eur = 40.32 // 1 євро коштує 40.32 грн.
        
        switch currency {
        case .uah:
            return product.price
        case .usd:
            return product.price / usd
        case .eur:
            return product.price / eur
        }
    }
}
