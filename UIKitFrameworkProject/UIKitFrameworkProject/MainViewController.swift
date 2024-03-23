//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    var counter: Int = 0

    @IBAction func addToCounter(_ sender: UIButton) {
        counter += 1
        firstLabel.text = "Pressed: \(counter)"
    }

    @IBAction func removeFromCounter(_ sender: UIButton) {
        counter -= 1
        if counter >= 0 {
            firstLabel.text = "Pressed: \(counter)"
        } else {
            firstLabel.text = "Pressed: 0"
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
