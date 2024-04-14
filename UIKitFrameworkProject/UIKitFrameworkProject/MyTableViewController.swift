//
//  MyTableViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyTableViewController: UITableViewController {
    var refresh: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        prepareDataSource()
        prepareSnapshot()

        refresh = UIRefreshControl()
        refresh.addAction(UIAction(handler: { [unowned self] action in
            self.refreshTable()
        }), for: .valueChanged)

        let text = AttributedString("Refreshing Table")
        refresh.attributedTitle = NSMutableAttributedString(text)
        tableView.refreshControl = refresh
    }

    func refreshTable() {
        prepareSnapshot()
        refresh.endRefreshing()
    }

    func prepareDataSource() {
        AppData.dataSource = UITableViewDiffableDataSource<Sections, ItemsData.ID>(tableView: tableView) { tableView, indexPath, itemID in
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
        var snapshot = NSDiffableDataSourceSnapshot<Sections, ItemsData.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(AppData.items.map({ $0.id }))
        AppData.dataSource.apply(snapshot)
    }

}
