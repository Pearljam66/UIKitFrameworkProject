//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var stackContainer: UIStackView!
    @IBOutlet weak var pageCounter: UIPageControl!

    var mainScrollView: UIScrollView!
    var imageViews: [UIImageView] = []
    var page: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        let images = ["spot1", "spot2", "spot3"]
        pageCounter.numberOfPages = images.count
        pageCounter.pageIndicatorTintColor = .black
        pageCounter.currentPageIndicatorTintColor = .white

        view.setNeedsLayout()
        view.layoutIfNeeded()
        let scrollWidth = stackContainer.frame.size.width
        let scrollHeight = stackContainer.frame.size.height

        mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(images.count), height: scrollHeight)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.isPagingEnabled = true
        mainScrollView.delegate = self

        var posX: CGFloat = 0
        for image in images {
            let childScrollView = UIScrollView(frame: CGRect(x: posX, y: 0, width: scrollWidth, height: scrollHeight))
            childScrollView.contentSize = CGSize(width: scrollWidth, height: scrollHeight)
            childScrollView.contentInsetAdjustmentBehavior = .never
            childScrollView.minimumZoomScale = 1.0
            childScrollView.maximumZoomScale = 4.0
            childScrollView.delegate = self

            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: scrollWidth, height: scrollHeight))
            imageView.image = UIImage(named: image)
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageViews.append(imageView)

            childScrollView.addSubview(imageView)
            mainScrollView.addSubview(childScrollView)
            posX = posX + scrollWidth
        }
        stackContainer.addArrangedSubview(mainScrollView)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = stackContainer.frame.size.width
        let getPage = round(mainScrollView.contentOffset.x / pageWidth)

        let currentPage = Int(getPage)
        if currentPage != page {
            let scroll = imageViews[page].superview as! UIScrollView
            scroll.setZoomScale(1.0, animated: true)
            page = Int(currentPage)
            pageCounter.currentPage = page
        }
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViews[page]
    }
}
