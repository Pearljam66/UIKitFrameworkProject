//
//  MyDataSource.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class MyDataSource: UITableViewDiffableDataSource<Sections, ItemsData.ID> {
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if let itemID = self.itemIdentifier(for: indexPath) {
                AppData.items.removeAll(where: { $0.id == itemID })

                var currentSnapshot = self.snapshot()
                currentSnapshot.deleteItems([itemID])
                self.apply(currentSnapshot)
            }
        }
    }

}
