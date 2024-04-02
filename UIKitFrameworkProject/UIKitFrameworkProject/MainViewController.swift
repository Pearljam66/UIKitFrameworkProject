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
        let imageView = UIImageView(image: UIImage(named: "doll"))
        let imageWidth = imageView.frame.size.width
        let imageHeight = imageView.frame.size.height

        let mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: imageWidth, height: imageHeight)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.delegate = self
        mainScrollView.addSubview(imageView)

        mainScrollView.minimumZoomScale = 1.0
        mainScrollView.maximumZoomScale = 4.0
        stackContainer.addArrangedSubview(mainScrollView)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
