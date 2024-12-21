//
//  SignUpView.swift
//  Lesson9HW
//

//

import UIKit

class SignUpView: UIView {
    
    // MARK: - User Info
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    // MARK: - Address Info
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    // MARK: - Bank Card Info
    @IBOutlet weak var cardNumberTextField: UITextField!
    @IBOutlet weak var expDateTextField: UITextField!
    @IBOutlet weak var cvvTextField: UITextField!
    // MARK: - Buttons
    @IBOutlet weak var signUpButton: UIButton!
    
    // MARK: - Actions
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        cvvTextField.text = ""
    }
}
