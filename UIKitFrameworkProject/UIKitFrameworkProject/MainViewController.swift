//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stackContainer: UIStackView!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsLayout()
        view.layoutIfNeeded()

        imageView = UIImageView(image: UIImage(named: "doll"))
        let imageWidth = imageView.frame.size.width
        let imageHeight = imageView.frame.size.height

        let mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: imageWidth, height: imageHeight)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.delegate = self
        mainScrollView.addSubview(imageView)

        let scrollWidth = stackContainer.frame.size.width
        let scrollHeight = stackContainer.frame.size.height
        let minScale = min(scrollWidth / imageWidth, scrollHeight / imageHeight)
        let maxScale = max(minScale * 4.0, 1.0)

        mainScrollView.minimumZoomScale = minScale
        mainScrollView.maximumZoomScale = maxScale

        stackContainer.addArrangedSubview(mainScrollView)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
