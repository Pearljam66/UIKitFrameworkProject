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
    @IBOutlet weak var subtitleInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // assigns the MainViewController as the delegate of the titleInput text field.
        titleInput.delegate = self
        subtitleInput.delegate = self
    }

    @IBAction func changeTitle(_ sender: UIButton) {
        if titleInput.text != "" && subtitleInput.text != "" {
            titleLabel.text = titleInput.text! + " - " + subtitleInput.text!
            titleInput.text = ""
            subtitleInput.text = ""
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        var maximum = 0

        if textField.tag == 1 {
            maximum = 10
        } else {
            maximum = 15
        }

        if let text = textField.text {
            let total = text.count + string.count - range.length
            if total > maximum {
                return false
            }
        }
        return true
    }

}
