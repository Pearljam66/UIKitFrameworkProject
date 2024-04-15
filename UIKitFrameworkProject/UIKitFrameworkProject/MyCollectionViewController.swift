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

        let customLayout = createLayout()
        collectionView.collectionViewLayout = customLayout

        prepareDataSource()
        prepareSnapshot()
    }

    func prepareDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<FoodCell, ItemsData.ID> { cell, indexPath, itemID in
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                cell.picture.image = UIImage(named: item.image)
            }
        }
        AppData.dataSource = UICollectionViewDiffableDataSource<Sections, ItemsData.ID>(collectionView: collectionView) { (collection, indexPath, itemID) in
            return collection.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemID)
        }
        let headerRegistration = UICollectionView.SupplementaryRegistration<MyHeader>(elementKind: UICollectionView.elementKindSectionHeader) { headerView, kind, indexPath in
            if let sectionID = AppData.dataSource.sectionIdentifier(for: indexPath.section) {
                headerView.pictureView.image = UIImage(named: "gradientTop")
                headerView.textView.text = sectionID == .selected ? "Selected" : "Available"
            }
        }
        AppData.dataSource.supplementaryViewProvider = { view, kind, indexPath in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
        }
    }

    func prepareSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, ItemsData.ID>()
        snapshot.appendSections([.selected, .available])
        AppData.dataSource.apply(snapshot, animatingDifferences: true)
        let selectedIDs = AppData.items.compactMap({ value in
            return value.selected ? value.id : nil
        })
        var selectedSnapshot = NSDiffableDataSourceSectionSnapshot<ItemsData.ID>()
        selectedSnapshot.append(selectedIDs)
        AppData.dataSource.apply(selectedSnapshot, to: .selected, animatingDifferences: false)

        let availableIDs = AppData.items.compactMap({ value in
            return value.selected ? nil : value.id
        })
        var availableSnapshot = NSDiffableDataSourceSectionSnapshot<ItemsData.ID>()
        availableSnapshot.append(availableIDs)
        AppData.dataSource.apply(availableSnapshot, to: .available, animatingDifferences: false)
    }

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .fractionalWidth(0.33))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.33))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let itemID = AppData.dataSource.itemIdentifier(for: indexPath) {
            if let item = AppData.items.first(where: { $0.id == itemID }) {
                if item.selected {
                    var selectedSnapshot = AppData.dataSource.snapshot(for: .selected)
                    selectedSnapshot.delete([itemID])
                    AppData.dataSource.apply(selectedSnapshot, to: .selected, animatingDifferences: true)
                    item.selected = false

                    let availableIDs = AppData.items.compactMap({ value in
                        return value.selected ? nil : value.id
                    })
                    var availableSnapshot = NSDiffableDataSourceSectionSnapshot<ItemsData.ID>()
                    availableSnapshot.append(availableIDs)
                    AppData.dataSource.apply(availableSnapshot, to: .available, animatingDifferences: false)
                } else {
                    var availableSnapshot = AppData.dataSource.snapshot(for: .available)
                    availableSnapshot.delete([itemID])
                    AppData.dataSource.apply(availableSnapshot, to: .available, animatingDifferences: true)
                    item.selected = true

                    let selectedIDs = AppData.items.compactMap({ value in
                        return value.selected ? value.id : nil
                    })
                    var selectedSnapshot = NSDiffableDataSourceSectionSnapshot<ItemsData.ID>()
                    selectedSnapshot.append(selectedIDs)
                    AppData.dataSource.apply(selectedSnapshot, to: .selected, animatingDifferences: false)
                }
            }
        }
    }

}

