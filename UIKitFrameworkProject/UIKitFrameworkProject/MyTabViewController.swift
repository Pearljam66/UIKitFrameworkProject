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

        let standard = UITabBarAppearance()
        standard.stackedItemPositioning = .centered
        standard.stackedItemWidth = 50
        standard.stackedItemSpacing = 100
        self.tabBar.scrollEdgeAppearance = standard
    }

}
