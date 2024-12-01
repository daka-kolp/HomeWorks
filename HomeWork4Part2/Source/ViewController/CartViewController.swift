//
//  ViewController.swift
//  HomeWork4Part2
//

//

import UIKit

class CartViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak var checkLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    
    // MARK: - Private
    private var cart = Cart()
    private var discount = Discount.none
    private var selectedCurrency = Currency.uah
    private var totalPrice = 0.0
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        showChanges()
    }
    
    // MARK: - IBAction
    @IBAction func buyButtonAction(_ sender: Any) {
        let title = "Підтвердження оплати"
        let message = "\nДо оплати:\n\n\(String(format: "%.2f", totalPrice)) \(selectedCurrency.rawValue)"
        showConfirmationAlert(title: title, message: message, totalPrice: totalPrice, currency: selectedCurrency)
    }
    
    @IBAction func currencySegmentAction(_ segmentControl: UISegmentedControl) {
        let selectedIndex = segmentControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            selectedCurrency = .uah
        case 1:
            selectedCurrency = .usd
        case 2:
            selectedCurrency = .eur
        default:
            break
        }
        showChanges()
    }
    
    @IBAction func discountSegmentAction(_ segmentControl: UISegmentedControl) {
        let selectedIndex = segmentControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            discount = .none
        case 1:
            discount = .regular
        case 2:
            discount = .vip
        default:
            break
        }
        showChanges()
    }
    
    // MARK: - Private
    private func loadData() {
        let responseFromServer = ResponseFromServer()
        let serverProducts = responseFromServer.sourceProducts
        let dataMapper = DataMapper()
        cart.products = dataMapper.products(from: serverProducts)
    }
    
    private func preparedCart() -> Cart {
        let filteredProducts: [Product] = cart.products.map {
            Product(
                name: $0.name,
                price: DataMapper().price(for: $0, currency: selectedCurrency),
                currency: selectedCurrency,
                motherBoard: $0.motherBoard
            )
        }
        let changedCart = Cart()
        changedCart.discount = discount
        changedCart.products = filteredProducts
        totalPrice = changedCart.totalPriceWithDiscount()
        
        return changedCart
    }
    
    private func showChanges() {
        let cartToShow = preparedCart()
        let printCheck = PrintCheck()
        checkLabel.text = printCheck.textOfCheck(cart: cartToShow)
    }
}

