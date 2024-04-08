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

    @IBAction func getPicture(_ sender: UIButton) {
        selectedPicture = pickerPictures.selectedRow(inComponent: 0)
        performSegue(withIdentifier: "showPicture", sender: self)
    }

    @IBAction func goBack(_ segue: UIStoryboardSegue) {
        let controller = segue.source as! SecondViewController
        ratings[selectedPicture] = controller.rating
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as! SecondViewController
        controller.rating = ratings[selectedPicture]
        controller.picture = picturesList[selectedPicture]
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return picturesList.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return picturesList[row]
    }

}
