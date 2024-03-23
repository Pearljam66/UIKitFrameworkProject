//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        var buttonConfiguration = UIButton.Configuration.tinted()
        buttonConfiguration.title = "Press me!"
        buttonConfiguration.subtitle = "Dooo iiiiitt"
        buttonConfiguration.baseBackgroundColor = .systemCyan

        let sarahButton = UIButton(configuration: buttonConfiguration, primaryAction: UIAction(handler: {
            [unowned self] action in
            print("Value of counter is: \(counter)")
            counter += 1
        }))
        sarahButton.frame = CGRect(x: 100, y: 200, width: 150, height: 50)
        view.addSubview(sarahButton)
    }

}
