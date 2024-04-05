//
//  ThirdViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/4/24.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var doorRating: UISlider!
    var doorRatingValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        doorRating.value = Float(doorRatingValue)
    }

    @IBAction func changeRating(_ sender: UISlider) {
        let value = round(sender.value)
        doorRating.value = value
        doorRatingValue = Int(value)
    }

}
