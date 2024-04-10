//
//  MenuViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/8/24.
//

import UIKit

class MenuViewController: UIViewController {

    @IBAction func goToPicture(_ sender: UIButton) {
        AppData.selectedPicture = sender.tag
        performSegue(withIdentifier: "showPicture", sender: self)
    }
}
