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
        self.contentConfiguration = config
    }

}
