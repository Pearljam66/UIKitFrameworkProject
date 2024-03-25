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

        let total = options.numberOfSegments
        options.insertSegment(action: UIAction(title: "Blue", image: nil, handler: { action in
            print("Blue Pressed")
        }), at: total, animated: false)

    }

    @IBAction func changeOption(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0:
                myTitle.textColor = .label
            case 1:
                myTitle.textColor = .systemRed
            case 2:
                myTitle.textColor = .systemBlue
            default:
                myTitle.textColor = .label
        }
    }

}
