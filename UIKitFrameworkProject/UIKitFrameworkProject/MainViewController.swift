//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var pictureView: UIImageView!
    var door: UIImage!
    var husky: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        door = UIImage(named: "door")
        husky = UIImage(named: "husky")
    }

    @IBAction func changePicture(_ sender: UIButton) {
        pictureView.image = door
    }

    @IBAction func changeToHusky(_ sender: UIButton) {
        pictureView.image = husky
    }

}
