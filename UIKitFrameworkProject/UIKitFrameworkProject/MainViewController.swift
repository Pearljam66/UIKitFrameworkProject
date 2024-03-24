//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myTitle: UILabel!

    @IBAction func changeOption(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            myTitle.textColor = .label
        } else if sender.selectedSegmentIndex == 1 {
            myTitle.textColor = .systemRed
        }
    }
    
}
