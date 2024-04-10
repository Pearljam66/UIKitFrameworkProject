//
//  MyTabViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/9/24.
//

import UIKit

class MyTabViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let controller = viewController as? SettingsViewController {
            let control = controller.myProperty
            if control != 0 {
                return false
            }
        }
        return true
    }
}
