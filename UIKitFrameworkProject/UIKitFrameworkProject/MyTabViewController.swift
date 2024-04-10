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

        var attributesNormal = AttributeContainer()
        attributesNormal.foregroundColor = .systemGray

        var attributesSelected = AttributeContainer()
        attributesSelected.foregroundColor = .systemGreen

        let standard = UITabBarAppearance()
        standard.backgroundColor = .systemGray5
        standard.stackedLayoutAppearance.normal.iconColor = .systemGray
        standard.compactInlineLayoutAppearance.normal.iconColor = .systemGray
        standard.inlineLayoutAppearance.normal.iconColor = .systemGray

        if let attributes = try? Dictionary(attributesNormal, including: \.uiKit) {
            standard.stackedLayoutAppearance.normal.titleTextAttributes = attributes
            standard.compactInlineLayoutAppearance.normal.titleTextAttributes = attributes
            standard.inlineLayoutAppearance.normal.titleTextAttributes = attributes
        }

        standard.stackedLayoutAppearance.selected.iconColor = .systemGreen
        standard.compactInlineLayoutAppearance.selected.iconColor = .systemGreen
        standard.inlineLayoutAppearance.selected.iconColor = .systemGreen

        if let attributes = try? Dictionary(attributesSelected, including: \.uiKit) {
            standard.stackedLayoutAppearance.selected.titleTextAttributes = attributes
            standard.compactInlineLayoutAppearance.selected.titleTextAttributes = attributes
            standard.inlineLayoutAppearance.selected.titleTextAttributes = attributes
        }
        self.tabBar.standardAppearance = standard
    }

}
