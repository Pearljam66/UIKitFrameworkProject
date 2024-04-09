//
//  MenuViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/8/24.
//

import UIKit

class MenuViewController: UIViewController {
    var myDelegate: AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        let app = UIApplication.shared
        myDelegate = app.delegate as? AppDelegate
    }

    @IBAction func goToPicture(_ sender: UIButton) {
        myDelegate.selectedPicture = sender.tag
        performSegue(withIdentifier: "showPicture", sender: self)
    }
}
