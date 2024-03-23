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

        if let oldText = firstLabel.attributedText {
            if let attrText = try? AttributedString(oldText, including: \.uiKit) {
                var myText = attrText
                myText.foregroundColor = .systemBlue
                firstLabel.attributedText = NSAttributedString(myText)
            }
        }

    }


}

