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
        dataProvider.loadUserData { self.updateUI($0) }
    }
    
    @IBAction func loadAdminDataButtonAction(_ sender: UIButton) {
        dataProvider.loadAdminData { self.updateUI($0) }
    }
    
    func updateUI(_ profile: ProfileData) {
        avaImageView.image = UIImage(named: profile.avatarName)
        firstNameLabel.text = profile.firstName
        lastNameLabel.text = profile.lastName
        eMailLabel.text = profile.email
        addressLabel.text = profile.adderss
    }
}
