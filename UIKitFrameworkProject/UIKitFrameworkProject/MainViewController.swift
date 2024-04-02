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
        // property that determines how the Scroll View is going to adjust the content's offsets
        // scrollable content will be shown in full screen
        mainScrollView.contentInsetAdjustmentBehavior = .never
        stackContainer.addArrangedSubview(mainScrollView)
    }

}
