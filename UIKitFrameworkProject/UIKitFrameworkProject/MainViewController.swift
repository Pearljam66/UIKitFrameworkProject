//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    var counter: Int = 0
    @IBOutlet weak var sarahButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        sarahButton.addAction(UIAction(handler: {
            [unowned self] action in
            print("Button pressed!!!")
            sarahButton.isEnabled = false
        }), for: .touchUpInside)
    }
}
