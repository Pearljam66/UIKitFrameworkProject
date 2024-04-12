//
//  FoodCellTableViewCell.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class FoodCell: UITableViewCell {

    var item: ItemsData!

    override func updateConfiguration(using state: UICellConfigurationState) {
        var config = self.defaultContentConfiguration()
        config.text = item.name
        config.secondaryText = "\(item.calories) Calories"
        config.image = UIImage(named: item.image)
        config.imageProperties.maximumSize = CGSize(width: 60, height: 60)
        config.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 0)
        self.contentConfiguration = config
    }

}
