//
//  FoodCellTableViewCell.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class FoodCell: UITableViewCell {
    private var customView: UIListContentView!
    private var customButton: UIButton!
    var item: ItemsData!

    override func updateConfiguration(using state: UICellConfigurationState) {
        createViews()

        if let configuration = self.customView.configuration as? UIListContentConfiguration {
            var config = configuration.updated(for: state)
            config.text = item.name
            config.secondaryText = "Calories: \(item.calories)"
            config.image = UIImage(named: item.image)
            config.imageProperties.maximumSize = CGSize(width: 60, height: 60)
            self.customView.configuration = config
        }
    }
    func createViews() {
        guard contentView.viewWithTag(999) == nil else { return }

        customView = UIListContentView(configuration: .subtitleCell())
        customView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(customView)

        customView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        customView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        customView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true

        customButton = UIButton(configuration: .plain(), primaryAction: UIAction(image: UIImage(systemName: "trash"), handler: { [unowned self] action in
            self.eraseItem()
        }))
        customButton.translatesAutoresizingMaskIntoConstraints = false
        customButton.tag = 999
        self.contentView.addSubview(customButton)

        customButton.leadingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 8).isActive = true
        customButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        customButton.centerYAnchor.constraint(equalTo: customView.centerYAnchor).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        customButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    func eraseItem() {
        AppData.items.removeAll(where: { $0.id == item.id })

        var currentSnapshot = AppData.dataSource.snapshot()
        currentSnapshot.deleteItems([item.id])
        AppData.dataSource.apply(currentSnapshot)
    }
}
