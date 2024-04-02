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
        mainScrollView.addSubview(imageView)
        stackContainer.addArrangedSubview(mainScrollView)
    }

}
