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

    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard sourceIndexPath != destinationIndexPath else { return }

        let item = AppData.items[sourceIndexPath.row]
        AppData.items.remove(at: sourceIndexPath.row)
        AppData.items.insert(item, at: destinationIndexPath.row)

        if let itemOrigin = self.itemIdentifier(for: sourceIndexPath), let itemDestination = self.itemIdentifier(for: destinationIndexPath) {
            var currentSnapshot = self.snapshot()
            if sourceIndexPath.row > destinationIndexPath.row {
                currentSnapshot.moveItem(itemOrigin, beforeItem: itemDestination)
            } else {
                currentSnapshot.moveItem(itemOrigin, afterItem: itemDestination)
            }
            self.apply(currentSnapshot, animatingDifferences: false)
        }
    }

}
