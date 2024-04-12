//
//  CustomConfig.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

struct CustomConfig: UIContentConfiguration {
    var name: String!
    var picture: UIImage!

    func makeContentView() -> UIView & UIContentView {
        let content = CustomContentView(configuration: self)
        return content
    }

    func updated(for state: any UIConfigurationState) -> CustomConfig {
        return self
    }

}
