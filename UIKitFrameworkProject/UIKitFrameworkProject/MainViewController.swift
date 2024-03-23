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

        var myText = AttributedString("Act II Cowboy Carter")

        let startIndex = myText.characters.startIndex
        let endIndex = myText.characters.index(startIndex, offsetBy: 6)

        myText[startIndex...endIndex].font = UIFont.systemFont(ofSize: 24)
        myText[startIndex...endIndex].foregroundColor = .systemRed
        firstLabel.attributedText = NSAttributedString(myText)
    }
}

