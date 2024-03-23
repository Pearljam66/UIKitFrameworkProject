//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let customFont = UIFont(name: "American Typewriter", size: 30)
        firstLabel.text = "Yo yo world!!!"
        firstLabel.font = customFont
    }


}

