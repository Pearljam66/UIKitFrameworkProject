//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var message: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func selection(_ sender: UIButton) {
        if let text = message.attributedText {
            if let attrText = try? AttributedString(text, including: \.uiKit) {
                if let newRange = Range(message.selectedRange, in: attrText) {
                    var newText = attrText
                    newText[newRange].foregroundColor = .systemRed
                    message.attributedText = NSAttributedString(newText)
                }
            }
        }
    }
    
}
