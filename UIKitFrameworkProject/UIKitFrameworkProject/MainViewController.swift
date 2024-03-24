//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var button: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Indicates whether the button tracks a selection, either through a menu or a toggle.
        button.changesSelectionAsPrimaryAction = true
        activity.color = .systemRed
        activity.style = .large
    }

    @IBAction func turnOnAndOff(_ sender: UIButton) {
        if activity.isAnimating {
            activity.stopAnimating()
            button.setTitle("Turn On", for: .normal)
        } else {
            activity.startAnimating()
            button.setTitle("Turn Off", for: .selected)
        }
    }
}
