//
//  AddItemViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class AddItemViewController: UIViewController {
    @IBOutlet weak var newItem: UITextField!

    @IBAction func saveItem(_ sender: UIButton) {
        var text = newItem.text!
        text = text.trimmingCharacters(in: .whitespaces)

        if text != "" {
            let lower = text.lowercased()
            let final = lower.capitalized

            let itemData = ItemsData(final, "noimage", 0, false)
            AppData.items.append(itemData)

            var snapshot = NSDiffableDataSourceSnapshot<Sections, ItemsData.ID>()
            snapshot.appendSections([.main])
            snapshot.appendItems(AppData.items.map({ $0.id }))
            AppData.dataSource.apply(snapshot, animatingDifferences: false)

            navigationController?.popViewController(animated: true)
        }
    }

}
