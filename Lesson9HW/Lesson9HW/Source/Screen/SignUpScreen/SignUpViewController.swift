//
//  SignUpViewController.swift
//  Lesson9HW
//

//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subscrubeNotifications()
        contentView.setKeyboardSettingsForTextFields(self)
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
       
        if textField === contentView.cardNumberTextField {
            return newString.count <= 16
        } else if textField === contentView.cvvTextField {
            return newString.count <= 3
        }
      
        return true
    }
}
