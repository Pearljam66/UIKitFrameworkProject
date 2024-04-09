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
        let app = UIApplication.shared
        myDelegate = app.delegate as? AppDelegate

        let selected = myDelegate.selectedPicture ?? 0
        let picture = myDelegate.picturesList[selected]
        let rating = myDelegate.ratings[selected]
        sliderRating.value = Float(rating)
        pictureView.image = UIImage(named: picture.lowercased())
    }

    @IBAction func changeRating(_ sender: UISlider) {
        let value = round(sender.value)
        sliderRating.value = value
        let selected = myDelegate.selectedPicture ?? 0
        myDelegate.ratings[selected] = Int(value)
    }

}
