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
        contentView.setKeyboardType()
    }
}

