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
        daTable.delegate = self
        daTable.register(UITableViewCell.self, forCellReuseIdentifier: "daCell")

        prepareDataSource()
        prepareSnapshot()
    }

    func prepareDataSource() {
        AppData.dataSource = UITableViewDiffableDataSource<Sections, ItemsData.ID>(tableView: daTable) { tableView, indexPath, itemID in
            let cell = tableView.dequeueReusableCell(withIdentifier: "daCell", for: indexPath)
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                cell.configurationUpdateHandler = { cell, state in
                    var config = cell.defaultContentConfiguration().updated(for: state)
                    config.text = item.name
                    config.secondaryText = "\(item.calories) Calories"
                    config.image = UIImage(named: item.image)
                    config.imageProperties.maximumSize = CGSize(width: 40, height: 40)
                    cell.contentConfiguration = config

                    cell.accessoryType = item.selected ? .checkmark : .none
                }
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let itemID = AppData.dataSource.itemIdentifier(for: indexPath) {
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                item.selected.toggle()
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
