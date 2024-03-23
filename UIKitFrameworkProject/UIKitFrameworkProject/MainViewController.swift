//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    var counter: Int = 0
    @IBOutlet weak var sarahButton: UIButton!
    @IBOutlet weak var sarahLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        sarahButton.changesSelectionAsPrimaryAction = true
        sarahButton.isSelected = false
    }

    @IBAction func turnOption(_ sender: UIButton) {
        if sender.isSelected {
            sarahLabel.text = "Onnnn!"
        } else {
            sarahLabel.text = "Offff!"
        }
    }
    
}
