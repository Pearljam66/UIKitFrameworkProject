//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var pictureView: UIImageView!
    var currentActive: Bool = false
    var door: UIImage!
    var husky: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        door = UIImage(named: "door")
        husky = UIImage(named: "husky")
    }

    @IBAction func changePicture(_ sender: UIButton) {
        if currentActive {
            pictureView.image = husky
        } else {
            pictureView.image = door
        }

        currentActive.toggle()
    }

}
