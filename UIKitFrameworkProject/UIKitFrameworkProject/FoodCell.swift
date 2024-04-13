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
        var config = CustomConfig().updated(for: state)
        config.name = item.name
        config.picture = UIImage(named: item.image)
        self.contentConfiguration = config
    }

}
