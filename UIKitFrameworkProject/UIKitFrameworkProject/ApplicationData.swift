//
//  ApplicationData.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

struct ApplicationData {
    var dataSource: UITableViewDiffableDataSource<Sections, ItemsData.ID>!

    var items: [ItemsData] = [] {
        didSet {
            items.sort(by: { $0.name < $1.name })
        }
    }

    init() {
        items.append(ItemsData("Bagels", "bagels", 250, false))
        items.append(ItemsData("Brownies", "brownies", 466, false))
        items.append(ItemsData("Butter", "butter", 717, false))
        items.append(ItemsData("Cheese", "cheese", 402, false))
        items.append(ItemsData("Coffee", "coffee", 0, false))
        items.append(ItemsData("Cookies", "cookies", 502, false))
        items.append(ItemsData("Donuts", "donuts", 452, false))
        items.append(ItemsData("Granola", "granola", 471, false))
        items.append(ItemsData("Juice", "juice", 23, false))
        items.append(ItemsData("Lemonade", "lemonade", 40, false))
        items.append(ItemsData("Lettuce", "lettuce", 15, false))
        items.append(ItemsData("Milk", "milk", 42, false))
        items.append(ItemsData("Oatmeal", "oatmeal", 68, false))
        items.append(ItemsData("Potatoes", "potato", 77, false))
        items.append(ItemsData("Tomatoes", "tomato", 18, false))
        items.append(ItemsData("Yogurt", "yogurt", 59, false))
    }
}

var AppData = ApplicationData()