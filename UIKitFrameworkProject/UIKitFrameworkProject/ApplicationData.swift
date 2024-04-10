//
//  ApplicationData.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/9/24.
//

import Foundation

struct ApplicationData {
    var picturesList: [String]
    var ratings: [Int]
    var selectedPicture: Int

    init() {
        picturesList = ["Husky", "Door"]
        ratings = [0,0]
        selectedPicture = 0
    }
}

var AppData = ApplicationData()
