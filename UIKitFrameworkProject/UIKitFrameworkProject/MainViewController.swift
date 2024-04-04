//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var picture: UIImageView!
    var previous: CGFloat = 0

    @IBAction func fadingOut(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: picture)
        let delta = translation.x - previous
        let width = picture.frame.size.width
        let alpha = picture.alpha + (delta / width)

        if alpha > 0.1 && alpha < 1 {
            picture.alpha = alpha
        }
        if sender.state == .ended {
            previous = 0
        } else {
            previous = translation.x
        }
    }

}
