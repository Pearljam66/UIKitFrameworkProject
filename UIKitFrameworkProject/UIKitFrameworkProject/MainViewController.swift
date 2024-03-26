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

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .systemRed
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = .white
    }

    @IBAction func changeTitle(_ sender: UIButton) {
        if titleInput.text != "" && subtitleInput.text != "" {
            titleLabel.text = titleInput.text! + " - " + subtitleInput.text!
            titleInput.text = ""
            subtitleInput.text = ""
        }
    }

}
