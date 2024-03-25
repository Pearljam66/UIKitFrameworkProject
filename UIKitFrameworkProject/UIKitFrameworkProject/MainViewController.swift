//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var switchValueLabel: UILabel!


    override func viewDidLoad() {
    }

    @IBAction func flipSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchValueLabel.textColor = .systemRed
        } else {
            switchValueLabel.textColor = .label
        }
    }
}
