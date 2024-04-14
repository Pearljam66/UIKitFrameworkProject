//
//  MyTableViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        prepareDataSource()
        prepareSnapshot()
    }

    func prepareDataSource() {
        AppData.dataSource = MyDataSource(tableView: tableView) { tableView, indexPath, itemID in
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                var config = cell.defaultContentConfiguration()
                config.text = item.name
                cell.contentConfiguration = config
            }
            return cell
        }
    }

    func prepareSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections.ID, ItemsData.ID>()
        snapshot.appendSections(AppData.sections.map({ $0.id }))
        for section in AppData.sections {
            let itemIDs = AppData.items.compactMap({ value in
                return value.section == section.name ? value.id : nil
            })
            snapshot.appendItems(itemIDs, toSection: section.id)
        }
        AppData.dataSource.apply(snapshot)
    }

}
