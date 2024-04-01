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
        husky = UIImage(named: "husky")
    }

    @IBAction func changePicture(_ sender: UIButton) {
        let thumbnail = husky.preparingThumbnail(of: CGSize(width: 100, height: 100))
        pictureView.contentMode = .top
        pictureView.image = thumbnail
    }

}
