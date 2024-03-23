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
        let size = UIFont.buttonFontSize
        let customFont = UIFont.systemFont(ofSize: size)
        firstLabel.text = "Beyonce's new album will be out Friday!!!"
        firstLabel.lineBreakMode = .byClipping
        firstLabel.font = customFont
    }


}

