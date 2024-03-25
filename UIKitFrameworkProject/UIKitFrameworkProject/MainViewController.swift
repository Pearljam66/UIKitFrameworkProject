//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // assigns the MainViewController as the delegate of the titleInput text field.
        titleInput.delegate = self
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        assignTitle()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .systemRed
    }

    @IBAction func changeTitle(_ sender: UIButton) {
        assignTitle()
    }

    func assignTitle() {
        titleLabel.text = titleInput.text
    }

}
