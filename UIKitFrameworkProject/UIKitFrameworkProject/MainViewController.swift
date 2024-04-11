//
//  MainViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var daTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        daTable.register(UITableViewCell.self, forCellReuseIdentifier: "daCell")
        AppData.dataSource = UITableViewDiffableDataSource<Sections, ItemsData.ID>(tableView: daTable) { tableView, indexPath, itemID in
            let cell = tableView.dequeueReusableCell(withIdentifier: "daCell", for: indexPath)

            if let item = AppData.items.first(where: { $0.id == itemID}) {
                var config = cell.defaultContentConfiguration()
                config.text = item.name
                cell.contentConfiguration = config
            }
            return cell
        }

        var snapshot = NSDiffableDataSourceSnapshot<Sections, ItemsData.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(AppData.items.map({ $0.id }))
        AppData.dataSource.apply(snapshot)
    }
}
