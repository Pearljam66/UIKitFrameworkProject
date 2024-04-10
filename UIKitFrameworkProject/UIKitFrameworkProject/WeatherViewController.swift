//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/9/24.
//

import UIKit

class WeatherViewController: UIViewController {
    var counter = 1

    @IBAction func updateBadge(_ sender: UIButton) {
        if let item = self.tabBarItem {
            item.title = "New Weather"
            item.badgeValue = String(counter)
            counter += 1
        }
    }
}
