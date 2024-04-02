//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var stackContainer: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let imageView = UIImageView(image: UIImage(named: "doll"))
        let imageWidth = imageView.frame.size.width
        let imageHeight = imageView.frame.size.height

        let mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: imageWidth, height: imageHeight)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.addSubview(imageView)

        let logoView = UIImageView(image: UIImage(named: "logo"))
        logoView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.addSubview(logoView)

        logoView.topAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.topAnchor, constant: 25).isActive = true
        logoView.leadingAnchor.constraint(equalTo: mainScrollView.frameLayoutGuide.leadingAnchor, constant: 25).isActive = true

        stackContainer.addArrangedSubview(mainScrollView)
    }

}
