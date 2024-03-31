//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var myButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        myButton.configurationUpdateHandler = { button in
            var current = button.configuration
            current?.title = "Add comment"
            current?.image = UIImage(systemName: "trash.circle")
            current?.imagePadding = 15
            button.configuration = current
        }
    }

}
