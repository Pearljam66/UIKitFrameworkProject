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
        let myFont = UIFont.preferredFont(forTextStyle: .headline)
        firstLabel.text = "Yo yo world!!!"
        firstLabel.font = myFont
    }


}

