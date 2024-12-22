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
        self.endEditing(true)
    }
    
    func setKeyboardSettingsForTextFields(_ delegate: UITextFieldDelegate) {
        firstNameTextField.delegate = delegate
        lastNameTextField.delegate = delegate
        emailNameTextField.delegate = delegate
        passwordTextField.delegate = delegate
        confirmPasswordTextField.delegate = delegate
        countryTextField.delegate = delegate
        cityTextField.delegate = delegate
        addressTextField.delegate = delegate
        cardNumberTextField.delegate = delegate
        expDateTextField.delegate = delegate
        cvvTextField.delegate = delegate
        
        firstNameTextField.returnKeyType = .done
        lastNameTextField.returnKeyType = .done
        emailNameTextField.returnKeyType = .done
        passwordTextField.returnKeyType = .done
        confirmPasswordTextField.returnKeyType = .done
        countryTextField.returnKeyType = .done
        cityTextField.returnKeyType = .done
        addressTextField.returnKeyType = .done
        cardNumberTextField.returnKeyType = .done
        expDateTextField.returnKeyType = .done
        cvvTextField.returnKeyType = .done
        
        emailNameTextField.keyboardType = .emailAddress
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
        cvvTextField.isSecureTextEntry = true
        cardNumberTextField.keyboardType = .numberPad
        expDateTextField.keyboardType = .numbersAndPunctuation
        cvvTextField.keyboardType = .numberPad
    }
}
