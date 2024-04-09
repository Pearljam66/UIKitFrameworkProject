//
//  SecondViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/8/24.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(image: UIImage(systemName: "trash"), primaryAction: UIAction(handler: { action in
            print("Button pressed")
        }))
        button.tintColor = UIColor.systemRed
        navigationItem.rightBarButtonItems = [button]
    }

}
