//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    var ratingHusky: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goBack(_ segue: UIStoryboardSegue) {
        let controller = segue.source as! SecondViewController
        ratingHusky = controller.rating
    }

}
