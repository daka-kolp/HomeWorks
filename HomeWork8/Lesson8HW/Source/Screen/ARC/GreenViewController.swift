//
//  GreenViewController.swift
//  Lesson8HW
//

//

import UIKit

class GreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showYellowScreen(_ sender: UIButton) {
        
        let yellowViewController = YellowViewController()
        navigationController?.pushViewController(yellowViewController, animated: true)
    }
    
    @IBAction func showBlueScreen(_ sender: Any) {
        
        let blueViewController = BlueViewController()
        navigationController?.pushViewController(blueViewController, animated: true)
    }
    
    @IBAction func showRedScreen(_ sender: UIButton) {
        
        let redViewController = RedViewController()
        navigationController?.pushViewController(redViewController, animated: true)
    }
}
