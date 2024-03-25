//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var myTitle: UILabel!
    @IBOutlet weak var options: UISegmentedControl!

    override func viewDidLoad() {
        options.setAction(UIAction(title: "Black", image: nil, handler: { action in
            print("Black pressed")
        }), forSegmentAt: 0)
        options.setAction(UIAction(title: "Red", image: nil, handler: { action in
            print("Red pressed")
        }), forSegmentAt: 1)
    }

    @IBAction func changeOption(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            myTitle.textColor = .label
        } else if sender.selectedSegmentIndex == 1 {
            myTitle.textColor = .systemRed
        }
    }
    
}
