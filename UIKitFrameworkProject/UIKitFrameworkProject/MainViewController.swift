//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var progress: UIProgressView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func updateProgress(_ sender: UISlider) {
        progress.progress = sender.value
    }

}
