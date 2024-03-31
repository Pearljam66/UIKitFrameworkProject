//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var date: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar.current
        var components = DateComponents()
        components.year = 2010
        components.month = 8
        components.day = 13

        if let newDate = calendar.date(from: components) {
            datePicker.date = newDate
        }
    }

    @IBAction func getDate(_ sender: UIButton) {
        let selectedDate = datePicker.date
        let format = selectedDate.formatted(date: .abbreviated, time: .omitted)
        date.text = "Date: \(format)"
    }

}
