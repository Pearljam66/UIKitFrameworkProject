//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var message: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        message.delegate = self
    }

    func textViewDidChange(_ textView: UITextView) {
        if let text = message.attributedText {
            if let attrText = try? AttributedString(text, including: \.uiKit) {
                let currentPosition = message.selectedRange
                var newText = attrText
                let chars = newText.characters

                for position in chars.indices {
                    let distance = chars.distance(from: position, to: chars.endIndex)
                    let endPosition = chars.index(position, offsetBy: min(distance, 5))
                    let word = String(chars[position..<endPosition])
                    if word == "Sarah" {
                        newText[position..<endPosition].foregroundColor = .systemBlue
                    }
                }

                message.attributedText = NSAttributedString(newText)
                message.selectedRange = currentPosition
            }
        }
    }

}
