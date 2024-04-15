//
//  MyCollectionViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self

        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat = 146
        var height: CGFloat = 100

        if indexPath.item % 3 == 0 {
            width = 292
            height = 200
        }
        return CGSize(width: width, height: height)
    }

}

