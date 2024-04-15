//
//  MyTableViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyTableViewController: UITableViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var picture: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Toronto's Waterfront"
        placeLabel.text = "Toronto"

        let now = Date.now
        dateLabel.text = now.formatted(date: .abbreviated, time: .omitted)
        picture.image = UIImage(named: "Toronto")
    }

}
