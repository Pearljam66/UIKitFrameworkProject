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

        if let number = defaultValues.object(forKey: "counter") as? Double{
            counter.value = number
            counterLabel.text = String(number)
        }

        if let lastDate = defaultValues.object(forKey:"lastDate") as? Date{
            let calendar = Calendar.current
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: lastDate, to: Date())
            print("You haven't use this app in \(components.year!) years, \(components.month!) months, \(components.day!) days, \(components.hour!) hours, \(components.minute!) minutes, \(components.second!) seconds")
        }
        defaultValues.set(Date(), forKey: "lastDate")
    }

    @IBAction func incrementValue(_ sender: UIStepper) {
        let current = counter.value
        defaultValues.set(current, forKey: "counter")
        counterLabel.text = String(current)
    }

}
