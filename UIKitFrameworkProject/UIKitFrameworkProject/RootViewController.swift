//
//  MainViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/4/24.
//

import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var container = AttributeContainer()
        container.font = UIFont.preferredFont(forTextStyle: .title1)
        container.foregroundColor = UIColor.white

        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor.systemRed

        if let keys = try? Dictionary(container, including: \.uiKit) {
            standard.titleTextAttributes = keys
        }

        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor.yellow

        let bar = navigationController?.navigationBar
        bar?.scrollEdgeAppearance = standard
        bar?.compactScrollEdgeAppearance = compact

        navigationController?.hidesBarsOnTap = true
    }

}
