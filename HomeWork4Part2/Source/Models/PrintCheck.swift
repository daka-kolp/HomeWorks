//
//  PrintCheck.swift
//  HomeWork4Part2
//

//

import Foundation

class PrintCheck {
    
    func textOfCheck(cart: Cart) -> String {
        
        var resultStringToPrint = ""
        
        let firstLine = "--- ФІСКАЛЬНИЙ ЧЕК ---"
        resultStringToPrint += firstLine
        
        let separatorLine = "\n--------------------"
        
        for index in 0 ..< cart.products.count {
            let product = cart.products[index]
            resultStringToPrint += "\n\(index + 1)\n"
            resultStringToPrint += product.textDescription()
        }
        
        resultStringToPrint += separatorLine
        
        resultStringToPrint += "\nTotal price: \(String(format: "%.2f", cart.totalPrice())) UAH"
        resultStringToPrint += "\nDiscount: \(cart.discountPercentValue())%"
        
        resultStringToPrint += separatorLine
        
        resultStringToPrint += "\nTotal price with Discount:\n\(String(format: "%.2f", cart.totalPriceWithDiscount())) \(cart.products.first?.currency.rawValue ?? "")"
        
        resultStringToPrint += separatorLine + separatorLine
        
        return resultStringToPrint
    }
}
