//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sayHello(_ sender: UIButton) {
        print("Hello!")
    }

    @IBAction func sayGoodbye(_ sender: UIButton) {
        print("Goodbye!")
    }
    
    @IBAction func disableButtons(_ sender: UIButton) {
        for button in buttons {
            button.isEnabled = false
        }
    }

    @IBAction func enableButtons(_ sender: UIButton) {
        for button in buttons {
            button.isEnabled = true
        }
    }
    

}
