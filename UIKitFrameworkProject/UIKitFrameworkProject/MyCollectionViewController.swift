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
        AppData.dataSource = UICollectionViewDiffableDataSource<Sections.ID, ItemsData.ID>(collectionView: collectionView) { (collection, indexPath, itemID) in
            return collection.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemID)
        }
        let headerRegistration = UICollectionView.SupplementaryRegistration<MyHeader>(elementKind: UICollectionView.elementKindSectionHeader) { headerView, kind, indexPath in
            headerView.pictureView.image = UIImage(named: "gradientTop")
            headerView.textView.text = AppData.sections[indexPath.section].name
        }
        AppData.dataSource.supplementaryViewProvider = { view, kind, indexPath in
            return self.collectionView.dequeueConfiguredReusableSupplementary(using: headerRegistration, for: indexPath)
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

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalWidth(0.5))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 10)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(60))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        section.boundarySupplementaryItems = [sectionHeader]

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

}

