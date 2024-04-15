//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/15/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counter: UIStepper!
    @IBOutlet weak var counterLabel: UILabel!

    var defaultValues: UserDefaults!

    override func viewDidLoad() {
        super.viewDidLoad()

        defaultValues = UserDefaults.standard

        if let number = defaultValues.object(forKey: "counter") as? Double {
            counter.value = number
            counterLabel.text = String(number)
        }
    }

    @IBAction func incrementValue(_ sender: UIStepper) {
        let current = counter.value
        defaultValues.set(current, forKey: "counter")
        counterLabel.text = String(current)
    }

}
