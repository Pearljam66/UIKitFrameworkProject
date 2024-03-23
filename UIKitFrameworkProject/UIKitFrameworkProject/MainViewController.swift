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

        if let range = myText.range(of: "Cowboy Carter") {
            myText[range].backgroundColor = .systemRed
        }

        for run in myText.runs {
            if run.attributes.backgroundColor == .systemRed {
                let range = run.range
                myText[range].backgroundColor = .systemGray4
            }
        }
        firstLabel.attributedText = NSAttributedString(myText)
    }
}
