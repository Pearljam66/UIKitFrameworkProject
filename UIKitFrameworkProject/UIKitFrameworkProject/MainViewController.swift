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
    var cities:[String]!

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerYears.delegate = self
        pickerYears.dataSource = self
        years = ["1944", "1945", "1946", "1947", "1948", "1949", "1950"]
        cities = ["Mountain View", "Sunnyvale", "Cupertino", "Santa Clara"]

        if let index = years.firstIndex(of: "1945") {
            pickerYears.selectRow(index, inComponent: 0, animated: false)
        }
    }

    @IBAction func getYear(_ sender: UIButton) {
        let rowCity = pickerYears.selectedRow(inComponent: 0)
        let rowYear = pickerYears.selectedRow(inComponent: 1)
        showYear.text = "The year is: \(years[rowYear]) in \(cities[rowCity])"
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return cities.count
        } else {
            return years.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return cities[row]
        } else {
            return years[row]
        }
    }

}
