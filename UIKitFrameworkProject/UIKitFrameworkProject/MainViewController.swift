//
//  ViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var progress: UIProgressView!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        slider.minimumValue = 0.0
        slider.maximumValue = 10.0
        slider.value = 0.0

        slider.minimumTrackTintColor = .systemRed
        slider.maximumTrackTintColor = .systemYellow
    }

    @IBAction func updateProgress(_ sender: UISlider) {
        let currentValue = sender.value / 10
        progress.progress = currentValue
    }

}
