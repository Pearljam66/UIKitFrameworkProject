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
    var rotating = false

    override func viewDidLoad() {
        super.viewDidLoad()
        let images = ["spot1", "spot2", "spot3"]
        pageCounter.numberOfPages = images.count
        pageCounter.pageIndicatorTintColor = .black
        pageCounter.currentPageIndicatorTintColor = .white

        view.setNeedsLayout()
        view.layoutIfNeeded()

        mainScrollView = UIScrollView(frame: .zero)
        mainScrollView.contentInsetAdjustmentBehavior = .never
        mainScrollView.isPagingEnabled = true
        mainScrollView.delegate = self

        for image in images {
            let childScrollView = UIScrollView(frame: .zero)
            childScrollView.contentInsetAdjustmentBehavior = .never
            childScrollView.minimumZoomScale = 1.0
            childScrollView.maximumZoomScale = 4.0
            childScrollView.delegate = self

            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: image)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageViews.append(imageView)
            childScrollView.addSubview(imageView)
            mainScrollView.addSubview(childScrollView)
        }
        stackContainer.addArrangedSubview(mainScrollView)

        updateSize()
    }

    func updateSize() {
        let scrollWidth = stackContainer.frame.size.width
        let scrollHeight = stackContainer.frame.size.height

        var posX: CGFloat = 0
        for imageView in imageViews {
            let scroll = imageView.superview as! UIScrollView
            scroll.frame = CGRect(x: posX, y: 0, width: scrollWidth, height: scrollHeight)
            scroll.contentSize = CGSize(width: scrollWidth, height: scrollHeight)
            imageView.frame = CGRect(x: 0, y: 0, width: scrollWidth, height: scrollHeight)
            posX = posX + scrollWidth
        }
        mainScrollView.contentSize = CGSize(width: scrollWidth * CGFloat(imageViews.count), height: scrollHeight)

        let scrollView = imageViews[page].superview as! UIScrollView
        mainScrollView.contentOffset = CGPoint(x: scrollView.frame.origin.x, y: 0)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !rotating {
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
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageViews[page]
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        rotating = true
        coordinator.animate(alongsideTransition: nil, completion: {(context: UIViewControllerTransitionCoordinatorContext!) in
            let scroll = self.imageViews[self.page].superview as! UIScrollView
            scroll.setZoomScale(1.0, animated: true)

            self.updateSize()
            self.rotating = false
        })
    }
}
