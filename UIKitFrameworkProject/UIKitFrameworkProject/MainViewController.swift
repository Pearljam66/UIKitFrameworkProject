//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stackContainer: UIStackView!

    var mainScrollView: UIScrollView!
    var image: UIImageView!
    var zooming = false

    override func viewDidLoad() {
        super.viewDidLoad()
        image = UIImageView(image: UIImage(named: "doll"))

        mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: image.frame.size.width, height: image.frame.size.width)
        mainScrollView.minimumZoomScale = 1.0
        mainScrollView.maximumZoomScale = 4.0
        mainScrollView.delegate = self
        mainScrollView.addSubview(image)

        let gesture = UITapGestureRecognizer(target: self, action: #selector(zoomPicture))
        mainScrollView.addGestureRecognizer(gesture)
        stackContainer.addArrangedSubview(mainScrollView)
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }

    @objc func zoomPicture(sender: UITapGestureRecognizer) {
        if !zooming {
            let position = sender.location(in: mainScrollView)
            mainScrollView.zoom(to: CGRect(x: position.x, y: position.y, width: 1, height: 1), animated: true)
            zooming = true
        } else {
            mainScrollView.setZoomScale(1.0, animated: true)
            zooming = false
        }
    }
}
