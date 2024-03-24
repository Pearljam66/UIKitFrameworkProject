//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var progressBar: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()

        progressBar.progress = 0.75
        progressBar.tintColor = UIColor.systemBlue
        progressBar.trackTintColor = UIColor.systemCyan
    }

}
