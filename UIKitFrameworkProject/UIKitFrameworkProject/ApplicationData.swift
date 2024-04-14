//
//  ApplicationData.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

struct ApplicationData {
    var dataSource: MyDataSource!
    var sections: [Sections] = []
    var items: [ItemsData] = []

    init() {
        sections.append(contentsOf: [Sections(name: "B"), Sections(name: "C"), Sections(name: "D"), Sections(name: "G"), Sections(name: "J"), Sections(name: "L"), Sections(name: "M"), Sections(name: "O"), Sections(name: "P"), Sections(name: "T"), Sections(name: "Y")])
        items.append(contentsOf: [ItemsData("Bagels", "bagels", 250, false, "B"), ItemsData("Brownies", "brownies", 466, false, "B"), ItemsData("Butter", "butter", 717, false, "B")])
        items.append(contentsOf: [ItemsData("Cheese", "cheese", 402, false, "C"), ItemsData("Coffee", "coffee", 0, false, "C"), ItemsData("Cookies", "cookies", 502, false, "C")])
        items.append(contentsOf: [ItemsData("Donuts", "donuts", 452, false, "D")])
        items.append(contentsOf: [ItemsData("Granola", "granola", 471, false, "G")])
        items.append(contentsOf: [ItemsData("Juice", "juice", 23, false, "J")])
        items.append(contentsOf: [ItemsData("Lemonade", "lemonade", 40, false, "L"), ItemsData("Lettuce", "lettuce", 15, false, "L")])
        items.append(contentsOf: [ItemsData("Milk", "milk", 42, false, "M")])
        items.append(contentsOf: [ItemsData("Oatmeal", "oatmeal", 68, false, "O")])
        items.append(contentsOf: [ItemsData("Potatoes", "potato", 77, false, "P")])
        items.append(contentsOf: [ItemsData("Tomatoes", "tomato", 18, false, "T")])
        items.append(contentsOf: [ItemsData("Yogurt", "yogurt", 59, false, "Y")])
    }
}

var AppData = ApplicationData()
