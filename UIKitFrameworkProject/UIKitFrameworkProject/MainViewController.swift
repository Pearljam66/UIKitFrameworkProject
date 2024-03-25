//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var switchValueLabel: UILabel!
    @IBOutlet weak var sarahSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        let colorBackground = UIColor(red: 0.9, green: 0.9, blue: 1.0, alpha: 1.0)
        let colorButton = UIColor(red: 0.5, green: 0.5, blue: 1.0, alpha: 1.0)
        sarahSwitch.onTintColor = colorBackground
        sarahSwitch.thumbTintColor = colorButton
    }

    @IBAction func flipSwitch(_ sender: UISwitch) {
        if sender.isOn {
            switchValueLabel.textColor = .systemPurple
        } else {
            switchValueLabel.textColor = .label
        }
    }
}
