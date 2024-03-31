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

        let configSize = UIImage.SymbolConfiguration(pointSize: 35, weight: .regular)
        let configColors = UIImage.SymbolConfiguration(paletteColors: [.systemPurple,.white])
        let config = configSize.applying(configColors)

        myButton.configurationUpdateHandler = { button in
            var current = button.configuration
            current?.title = "Delete comment"
            current?.image = UIImage(systemName: "bell.badge.circle.fill", withConfiguration: config)
            current?.imagePadding = 15
            button.configuration = current
        }
    }

}
