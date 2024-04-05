//
//  SecondViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/3/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var sliderRating: UISlider!
    var huskyRatingValue: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderRating.value = Float(huskyRatingValue)
    }

    @IBAction func changeRating(_ sender: UISlider) {
        let value = round(sender.value)
        sliderRating.value = value
        huskyRatingValue = Int(value)
    }
}
