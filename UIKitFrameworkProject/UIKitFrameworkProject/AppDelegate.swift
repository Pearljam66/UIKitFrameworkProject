//
//  AppDelegate.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 3/22/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var picturesList: [String]!
    var ratings: [Int]!
    var selectedPicture: Int!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        picturesList = ["Husky", "Door"]
        ratings = [0,0]
        selectedPicture = 0
        return true
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

}

