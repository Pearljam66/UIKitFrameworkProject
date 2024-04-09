//
//  SecondViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/8/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func closeView(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
