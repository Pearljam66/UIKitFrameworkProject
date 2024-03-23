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
        sarahButton.changesSelectionAsPrimaryAction = true

        sarahButton.menu = UIMenu(children: [
            UIAction(title: "Option 1", identifier: UIAction.Identifier("1"), handler: selectOption),
            UIAction(title: "Option 2", identifier: UIAction.Identifier("2"), handler: selectOption),
            UIAction(title: "Option 3", identifier: UIAction.Identifier("3"), handler: selectOption)
        ])
    }

    @IBAction func processOptions(_ sender: UIButton) {
        if let selected = sarahButton.menu?.selectedElements.first as? UIAction {
            print("Selected: \(selected.title)")
        }
    }

    func selectOption(action: UIAction) {
        print(action.title)
    }

}
