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

        // AttributeContainer provides a way to store attributes and their values outside of an attributed string.
        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: .body)
        container.backgroundColor = .systemGray4
        myText.setAttributes(container)

        firstLabel.attributedText = NSAttributedString(myText)
    }
}
