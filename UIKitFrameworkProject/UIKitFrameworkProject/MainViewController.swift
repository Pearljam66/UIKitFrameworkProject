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
        let images = ["spot1", "spot2", "spot3"]

        view.setNeedsLayout()
        view.layoutIfNeeded()
        let scrollWidth = stackContainer.frame.size.width
        let scrollHeight = stackContainer.frame.size.height

        let mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(images.count), height: scrollHeight)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.isPagingEnabled = true

        var posX: CGFloat = 0

        for image in images {
            let imageView = UIImageView(frame: CGRect(x: posX, y: 0, width: scrollWidth, height: scrollHeight))
            imageView.image = UIImage(named: image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true

            mainScrollView.addSubview(imageView)
            posX = posX + scrollWidth
        }

        stackContainer.addArrangedSubview(mainScrollView)
    }
}
