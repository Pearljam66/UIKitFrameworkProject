//
//  MyTabViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/9/24.
//

import UIKit

class MyTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let list = viewControllers!
        let controller = list[0] as! ViewController
        controller.tabBarItem?.badgeValue = String(20)

        self.selectedIndex = 1
    }

}
