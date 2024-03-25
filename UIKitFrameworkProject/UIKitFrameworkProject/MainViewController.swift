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

    @IBAction func changeTitle(_ sender: UIButton) {
        var text = titleInput.text!
        text = text.trimmingCharacters(in: .whitespaces)

        if !text.isEmpty {
            titleLabel.text = text
            titleInput.text = ""
            titleInput.placeholder = "Text Field Disabled"
            titleInput.isEnabled = false
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (Int(string) != nil && textField.text != "0") || string == "" {
            return true
        }
        return false
    }

}
