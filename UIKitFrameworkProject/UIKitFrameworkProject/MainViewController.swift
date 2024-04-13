//
//  MainViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var daTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        daTable.register(UITableViewCell.self, forCellReuseIdentifier: "daCell")

        prepareDataSource()
        prepareSnapshot()
    }

    func prepareDataSource() {
        AppData.dataSource = UITableViewDiffableDataSource<Sections, ItemsData.ID>(tableView: daTable) { tableView, indexPath, itemID in
            let cell = tableView.dequeueReusableCell(withIdentifier: "daCell", for: indexPath) as! FoodCell

            if let item = AppData.items.first(where: { $0.id == itemID}) {
                cell.item = item
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
