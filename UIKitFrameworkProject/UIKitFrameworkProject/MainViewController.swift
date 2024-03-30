//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var showYear: UILabel!
    @IBOutlet weak var pickerYears: UIPickerView!

    var years:[String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerYears.delegate = self
        pickerYears.dataSource = self
        years = ["1944", "1945", "1946", "1947", "1948", "1949", "1950"]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return years.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return years[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let year = years[row]
        showYear.text = "The year is: \(year)"
    }

}
