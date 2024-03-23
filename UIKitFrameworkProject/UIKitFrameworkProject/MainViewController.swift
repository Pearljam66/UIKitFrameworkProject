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

        var myText = NSMutableAttributedString(string: "Act II Cowboy Carter")
        myText.addAttribute(.font, value: UIFont.preferredFont(forTextStyle: .largeTitle), range: NSRange(location: 0, length: myText.length))

        let shadow = NSShadow()
        shadow.shadowColor = UIColor.systemGray
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        shadow.shadowBlurRadius = 5
        myText.addAttribute(.shadow, value: shadow, range: NSRange(location: 0, length: myText.length))

        firstLabel.attributedText = myText
    }
}
