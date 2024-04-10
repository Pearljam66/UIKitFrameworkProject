//
//  PictureViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/8/24.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet weak var sliderRating: UISlider!
    @IBOutlet weak var pictureView: UIImageView!

    var myDelegate: AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        let selected = AppData.selectedPicture
        let picture = AppData.picturesList[selected]
        let rating = AppData.ratings[selected]
        sliderRating.value = Float(rating)
        pictureView.image = UIImage(named: picture.lowercased())
    }

    @IBAction func changeRating(_ sender: UISlider) {
        let value = round(sender.value)
        sliderRating.value = value
        let selected = AppData.selectedPicture
        AppData.ratings[selected] = Int(value)
    }

}
