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

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.configurationUpdateHandler = { [unowned self] button in
            var current = button.configuration
            current?.title = "Add Me"
            current?.showsActivityIndicator = counter > 0 ? true : false
            current?.imagePlacement = .trailing
            current?.imagePadding = 15
            button.configuration = current
        }
    }

    @IBAction func addToCounter(_ sender: UIButton) {
        counter += 1
        firstLabel.text = "Pressed: \(counter)"
    }

    @IBAction func removeFromCounter(_ sender: UIButton) {
        counter -= 1
        if counter >= 0 {
            firstLabel.text = "Pressed: \(counter)"
            addButton.setNeedsUpdateConfiguration()
        }
    }

}
