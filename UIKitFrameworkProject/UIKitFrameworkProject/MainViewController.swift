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
        let customFont = UIFont.systemFont(ofSize: 30)
        firstLabel.text = "Act II Cowboy Carter"
        firstLabel.lineBreakMode = .byClipping
        firstLabel.font = customFont
        firstLabel.textColor = UIColor.systemBlue
        firstLabel.shadowColor = UIColor.systemGray
        firstLabel.shadowOffset = CGSize(width: 2, height: 2)
    }


}

