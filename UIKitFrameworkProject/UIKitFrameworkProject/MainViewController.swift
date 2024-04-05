//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    var ratingHusky: Int = 0
    var ratingDoor: Int = 0

    @IBAction func goBack(_ segue: UIStoryboardSegue) {
        if segue.identifier == "removeHusky" {
            let controller = segue.source as! SecondViewController
            ratingHusky = controller.huskyRatingValue
        } else if segue.identifier == "removeDoor" {
            let controller = segue.source as! ThirdViewController
            ratingDoor = controller.doorRatingValue
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showHusky" {
            let controller = segue.destination as! SecondViewController
            controller.huskyRatingValue = ratingHusky
        } else if segue.identifier == "showDoor" {
            let controller = segue.destination as! ThirdViewController
            controller.doorRatingValue = ratingDoor
        }
    }

}
