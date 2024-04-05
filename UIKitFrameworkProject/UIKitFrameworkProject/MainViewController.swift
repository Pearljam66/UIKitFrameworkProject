//
//  MainViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/4/24.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerPictures: UIPickerView!

    var picturesList: [String]!
    var ratings: [Int]!
    var selectedPicture: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        pickerPictures.delegate = self
        pickerPictures.dataSource = self

        picturesList = ["husky", "door"]
        ratings = [0, 0]
        selectedPicture = 0
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picturesList.count
    }

}
