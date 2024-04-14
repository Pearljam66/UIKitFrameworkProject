//
//  Sections.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

class Sections: Identifiable {
    var id: UUID = UUID()
    var name: String

    init(name: String) {
        self.name = name
    }
}
