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
        var text = titleInput.text!
        text = text.trimmingCharacters(in: .whitespaces)

        if !text.isEmpty {
            titleLabel.text = text
            titleInput.text = ""
        }
    }
    
}
