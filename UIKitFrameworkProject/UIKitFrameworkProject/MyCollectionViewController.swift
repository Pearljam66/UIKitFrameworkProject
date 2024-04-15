//
//  MyCollectionViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareDataSource()
        prepareSnapshot()
    }

    func prepareDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FoodCell, ItemsData.ID> { cell, indexPath, itemID in
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                cell.picture.image = UIImage(named: item.image)
            }

            cell.configurationUpdateHandler = { cell, state in
                var backgroundConfig = UIBackgroundConfiguration.listPlainCell().updated(for: state)
                backgroundConfig.cornerRadius = 10

                if state.isSelected {
                    backgroundConfig.backgroundColor = .systemPink
                } else {
                    backgroundConfig.backgroundColor = .systemBackground
                }
                cell.backgroundConfiguration = backgroundConfig
            }
        }

        AppData.dataSource = UICollectionViewDiffableDataSource<Sections, ItemsData.ID>(collectionView: collectionView) { (collection, indexPath, itemID) in
            return collection.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemID)
        }
    }

    func prepareSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, ItemsData.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(AppData.items.map({ $0.id }))
        AppData.dataSource.apply(snapshot)
    }

}

