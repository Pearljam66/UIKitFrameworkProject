//
//  MainViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/4/24.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(title: "Close")
        button.tintColor = UIColor.systemGreen

        navigationItem.backBarButtonItem = button
    }

}
