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

        let buttonAppearance = UIBarButtonItemAppearance()

        if let textAttributes = try? Dictionary(container, including: \.uiKit) {
            buttonAppearance.normal.titleTextAttributes = textAttributes
        }

        let standard = UINavigationBarAppearance()
        standard.backgroundColor = UIColor.systemGray4
        standard.backButtonAppearance = buttonAppearance
        standard.setBackIndicatorImage(UIImage(systemName: "arrow.backward.circle"), transitionMaskImage: UIImage(systemName: "arrow.backward.circle"))

        let compact = UINavigationBarAppearance()
        compact.backgroundColor = UIColor.yellow

        let bar = navigationController?.navigationBar
        bar?.scrollEdgeAppearance = standard
        bar?.compactScrollEdgeAppearance = compact
    }

}
