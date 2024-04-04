//
//  SecondViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/3/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var sliderRating: UISlider!
    var rating: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderRating.value = Float(rating)
    }

    @IBAction func changeRating(_ sender: UISlider) {
        let value = round(sender.value)
        sliderRating.value = value
        rating = Int(value)
    }
}
