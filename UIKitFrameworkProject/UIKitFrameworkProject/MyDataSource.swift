//
//  MyDataSource.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyDataSource: UITableViewDiffableDataSource<Sections.ID, ItemsData.ID> {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AppData.sections[section].name
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            if let itemID = self.itemIdentifier(for: indexPath), let sectionID = self.sectionIdentifier(for: indexPath.section) {
                AppData.items.removeAll(where: { $0.id == itemID })

                var currentSnapshot = self.snapshot()
                currentSnapshot.deleteItems([itemID])
                if currentSnapshot.numberOfItems(inSection: sectionID) <= 0 {
                    AppData.sections.removeAll(where: { $0.id == sectionID })
                    currentSnapshot.deleteSections([sectionID])
                }
                self.apply(currentSnapshot)
            }
        }
    }

}
