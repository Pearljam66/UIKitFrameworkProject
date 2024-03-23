//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var removeButton: UIButton!
    @IBOutlet weak var firstLabel: UILabel!
    var counter: Int = 0

    @IBAction func addToCounter(_ sender: UIButton) {
        counter += 1
        firstLabel.text = "Pressed: \(counter)"

        var addButtonConfiguration = addButton.configuration
        addButtonConfiguration?.title = "Adding \(counter)"
        addButton.configuration = addButtonConfiguration
    }

    @IBAction func removeFromCounter(_ sender: UIButton) {
        counter -= 1
        if counter >= 0 {
            firstLabel.text = "Pressed: \(counter)"
        } else {
            var removeButtonConfiguration = removeButton.configuration
            removeButtonConfiguration?.title = "Can't press this!"
            removeButton.configuration = removeButtonConfiguration
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
