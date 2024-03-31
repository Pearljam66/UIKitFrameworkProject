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
    }

    @IBAction func getDate(_ sender: UIButton) {
        let selectedDate = datePicker.date
        let format = selectedDate.formatted(date: .abbreviated, time: .omitted)
        date.text = "Date: \(format)"
    }

}
