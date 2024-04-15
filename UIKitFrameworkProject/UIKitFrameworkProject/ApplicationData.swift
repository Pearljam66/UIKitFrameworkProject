//
//  ApplicationData.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

enum Sections {
    case selected, available
}

class ItemsData: Identifiable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var calories: Int
    var selected: Bool

    init(_ name: String, _ image: String, _ calories: Int, _ selected: Bool) {
        self.name = name
        self.image = image
        self.calories = calories
        self.selected = selected
    }
}

struct ApplicationData {
    var dataSource: UICollectionViewDiffableDataSource<Sections, ItemsData.ID>!

    var items: [ItemsData] = [] {
        didSet {
            items.sort(by: { $0.name < $1.name })
        }
    }

    init() {
        items.append(contentsOf: [ItemsData("Bagels", "bagels", 250, false), ItemsData("Brownies", "brownies", 466, false), ItemsData("Butter", "butter", 717, false), ItemsData("Cheese", "cheese", 402, false), ItemsData("Coffee", "coffee", 0, false), ItemsData("Cookies", "cookies", 502, false), ItemsData("Donuts", "donuts", 452, false), ItemsData("Granola", "granola", 471, false), ItemsData("Juice", "juice", 23, false), ItemsData("Lemonade", "lemonade", 40, false), ItemsData("Lettuce", "lettuce", 15, false), ItemsData("Milk", "milk", 42, false), ItemsData("Oatmeal", "oatmeal", 68, false), ItemsData("Potatoes", "potato", 77, false), ItemsData("Tomatoes", "tomato", 18, false), ItemsData("Yogurt", "yogurt", 59, false)])
    }
}

var AppData = ApplicationData()
