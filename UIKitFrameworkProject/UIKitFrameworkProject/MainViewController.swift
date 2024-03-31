//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let myPattern = UIImage(named: "Oranges") {
            view.backgroundColor = UIColor(patternImage: myPattern)
        }
    }

}
