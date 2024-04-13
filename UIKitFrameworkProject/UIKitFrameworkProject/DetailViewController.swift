//
//  DetailViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var nutritionItem: UITextView!

    var selected: ItemsData!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if selected != nil {
            titleItem.text = selected.name
            imageItem.image = UIImage(named: selected.image)
            nutritionItem.text = "Calories: \(selected.calories)"
        }
    }

}
