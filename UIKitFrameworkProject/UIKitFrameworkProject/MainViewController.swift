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

    @IBAction func showCounter(_ sender: UIButton) {
        counter += 1
        firstLabel.text = "Pressed: \(counter)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
