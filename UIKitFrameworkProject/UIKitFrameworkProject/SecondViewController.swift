//
//  SecondViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/4/24.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var sliderRating: UISlider!
    @IBOutlet weak var pictureView: UIImageView!

    var rating: Int = 0
    var picture: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        sliderRating.value = Float(rating)
        pictureView.image = UIImage(named: picture.lowercased())
    }

    @IBAction func changeRating(_ sender: UISlider) {
        let value = round(sender.value)
        sliderRating.value = value
        rating = Int(value)
    }

    @IBAction func goBack(_ sender: UIButton) {
        performSegue(withIdentifier: "goBack", sender: self)
    }

}
