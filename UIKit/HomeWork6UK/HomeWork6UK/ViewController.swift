//
//  ViewController.swift
//  HomeWork6UK
//
//  Created by Daria Kolpakova on 07.12.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var discountText: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productCode: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var buyOnCreditButton: UIButton!
    @IBOutlet weak var buyNowButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBuyOnCreditStyle()
        setProductInfo()
    }
    
    @IBAction func buyNowButtonClicked(_ sender: Any) {
        print("Buy Now Clicked")
    }
    
    @IBAction func buyOnCreditButtonClicked(_ sender: Any) {
        print("Buy On Credit Clicked")
    }
    
    private func setBuyOnCreditStyle() {
        buyOnCreditButton.layer.borderColor = UIColor.lightGray.cgColor
        buyOnCreditButton.layer.masksToBounds = true
        buyOnCreditButton.layer.borderWidth = 1.0
        buyOnCreditButton.layer.cornerRadius = 8.0
    }
    
    private func setProductInfo() {
        productImage.image = UIImage(named: "img")
        discountText.text = "-10%"
        productName.text = "Motherboard, Asus ROG Strix B550-E Gaming (s AM4, AMD B550, PCI-Ex16))"
        productCode.text = "Code 218525893"
        productPrice.text = "1000"
    }
}

