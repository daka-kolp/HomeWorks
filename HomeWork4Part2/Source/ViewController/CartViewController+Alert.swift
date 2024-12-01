//
//  CartViewController+Alert.swift
//  HomeWork4Part2
//

//

import UIKit

// MARK: - CartViewController+Alert
extension CartViewController {
    
    func showConfirmationAlert(title: String, message: String, totalPrice: Double, currency: Currency) {

        
        let buyAction = UIAlertAction(title: "Оплатити", style: .default)
        let cancelAction = UIAlertAction(title: "Закрити", style: .destructive)
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(buyAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}
