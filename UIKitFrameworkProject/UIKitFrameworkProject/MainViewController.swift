//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var sarahButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        sarahButton.showsMenuAsPrimaryAction = true

        sarahButton.menu = UIMenu(children: [
            UIAction(title: "Option 1", handler: selectOption),
            UIAction(title: "Option 2", handler: selectOption),
            UIAction(title: "Option 3", handler: selectOption)
        ])
    }

    func selectOption(action: UIAction) {
        print(action.title)
    }

}
