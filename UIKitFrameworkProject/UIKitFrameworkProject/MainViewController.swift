//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func changeTitle(_ sender: UIButton) {
        if titleInput.text != "" {
            titleLabel.text = titleInput.text
            titleInput.text = ""
            titleInput.resignFirstResponder()
        } else {
            titleInput.becomeFirstResponder()
        }
    }
}
