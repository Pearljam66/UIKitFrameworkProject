//
//  ItemsData.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

class ItemsData: Identifiable {
    var id: UUID = UUID()
    var name: String
    var image: String
    var calories: Int
    var selected: Bool
    var section: String

    init(_ name: String,_ image: String,_ calories: Int,_ selected: Bool, _ section: String) {
        self.name = name
        self.image = image
        self.calories = calories
        self.selected = selected
        self.section = section
    }
}
