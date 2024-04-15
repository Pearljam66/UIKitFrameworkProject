//
//  MyCollectionViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

private let reuseIdentifier = "Cell"

class MyCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let cellRegistration = UICollectionView.CellRegistration<FoodCell, ItemsData.ID> { cell, indexPath, itemID in
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                cell.picture.image = UIImage(named: item.image)
            }
        }

        AppData.dataSource = UICollectionViewDiffableDataSource<Sections, ItemsData.ID>(collectionView: collectionView) { (collection, indexPath, itemID) in
            return collection.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemID)
        }

        var snapshot = NSDiffableDataSourceSnapshot<Sections, ItemsData.ID>()
        snapshot.appendSections([.main])
        snapshot.appendItems(AppData.items.map({ $0.id }))
        AppData.dataSource.apply(snapshot)
    }

}
