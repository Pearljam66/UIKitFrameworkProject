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

        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .black)
        myButton.configurationUpdateHandler = { button in
            var current = button.configuration
            current?.title = "Delete comment"
            current?.image = UIImage(systemName: "trash", withConfiguration: config)
            current?.imagePadding = 15
            button.configuration = current
        }
    }

}
