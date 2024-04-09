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
        let standard = UIToolbarAppearance()
        standard.backgroundColor = .yellow
        navigationController?.toolbar.scrollEdgeAppearance = standard

        let button = UIBarButtonItem(image: UIImage(systemName: "trash"), primaryAction: UIAction(handler: { action in
            print("button pressed!!")
        }))
        button.tintColor = .systemRed
        self.setToolbarItems([button], animated: false)
    }

}
