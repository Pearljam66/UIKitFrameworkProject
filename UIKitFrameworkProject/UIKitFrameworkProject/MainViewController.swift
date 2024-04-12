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
        daTable.rowHeight = 80
        daTable.separatorStyle = .none

        prepareDataSource()
        prepareSnapshot()
    }

    func prepareDataSource() {
        AppData.dataSource = UITableViewDiffableDataSource<Sections, ItemsData.ID>(tableView: daTable) { tableView, indexPath, itemID in
            let cell = tableView.dequeueReusableCell(withIdentifier: "daCell", for: indexPath)

            if let item = AppData.items.first(where: { $0.id == itemID}) {
                var config = UIListContentConfiguration.valueCell()
                config.text = item.name
                config.textProperties.color = .purple
                config.secondaryText = "\(item.calories) Calories"
                config.secondaryTextProperties.color = .systemGray

                config.image = UIImage(named: item.image)
                config.imageProperties.maximumSize = CGSize(width: 40, height: 40)
                cell.contentConfiguration = config

                cell.configurationUpdateHandler = { cell, state in
                    var backgroundConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)
                    backgroundConfig.backgroundInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
                    backgroundConfig.cornerRadius = 10

                    if state.isSelected {
                        backgroundConfig.backgroundColor = .systemBlue
                    } else {
                        backgroundConfig.backgroundColor = .systemGray6
                    }
                    cell.backgroundConfiguration = backgroundConfig
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
}
