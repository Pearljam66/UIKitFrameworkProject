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

        let mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(images.count), height: scrollHeight)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.isPagingEnabled = true
        mainScrollView.delegate = self

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

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = stackContainer.frame.size.width
        let getPage = round(mainScrollView.contentOffset.x / pageWidth)
        let currentPage = Int(getPage)

        page = currentPage
        pageCounter.currentPage = page
    }
}
