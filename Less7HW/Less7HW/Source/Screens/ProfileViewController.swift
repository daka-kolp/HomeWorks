//
//  ProfileViewController.swift
//  Less7HW
//

//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var avaImageView: UIImageView!
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var eMailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    private let dataProvider = DataProviderService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loadUserDataButtonAction(_ sender: UIButton) {
        
        dataProvider.loadUserData()
    }
    
    @IBAction func loadAdminDataButtonAction(_ sender: UIButton) {
        
        dataProvider.loadAdminData()
    }
    
    func updateUI() {
        
//        avaImageView.image = UIImage(named: "")
//        firstNameLabel.text =
//        lastNameLabel.text =
//        eMailLabel.text =
//        addressLabel.text =
    }
}
