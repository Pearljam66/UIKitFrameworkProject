//
//  CustomContentView.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class CustomContentView: UIView, UIContentView {
    let picture = UIImageView(frame: .zero)
    let name = UILabel(frame: .zero)

    var configuration: UIContentConfiguration {
        didSet {
            newConfiguration()
        }
    }

    init(configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame: .zero)

        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.contentMode = .scaleAspectFit
        self.addSubview(picture)

        let cp1 = picture.widthAnchor.constraint(equalToConstant: 100)
        let cp2 = picture.heightAnchor.constraint(equalToConstant: 100)
        let cp3 = picture.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        let cp4 = picture.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        let cp5 = picture.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        cp5.priority = .defaultLow
        self.addConstraints([cp1, cp2, cp3, cp4, cp5])

        name.translatesAutoresizingMaskIntoConstraints = false
        name.numberOfLines = 1
        name.font = UIFont.preferredFont(forTextStyle: .title1)
        self.addSubview(name)

        let cn1 = name.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let cn2 = name.trailingAnchor.constraint(equalTo: picture.leadingAnchor, constant: 0)
        let cn3 = name.centerYAnchor.constraint(equalTo: picture.centerYAnchor)
        self.addConstraints([cn1, cn2, cn3])

        newConfiguration()
    }

    func newConfiguration() {
        if let config = self.configuration as? CustomConfig {
            name.text = config.name
            picture.image = config.picture
        }
    }

    required init?(coder: NSCoder) {
        fatalError("Error")
    }

}
