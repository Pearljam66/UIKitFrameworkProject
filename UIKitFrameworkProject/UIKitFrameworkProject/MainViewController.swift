//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!

    override func viewDidLoad() {
        super.viewDidLoad()
        stepper.value = 0.0
        stepper.minimumValue = 0.0
        stepper.maximumValue = 10.0
        stepper.stepValue = 1.0
    }

    @IBAction func increment(_ sender: UIStepper) {
        counterLabel.text = String(sender.value)
    }

}
