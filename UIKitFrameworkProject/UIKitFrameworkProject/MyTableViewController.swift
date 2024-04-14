//
//  MyTableViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    var refresh: UIRefreshControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        prepareDataSource()
        prepareSnapshot()

        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false

        let searchBar = searchController.searchBar
        searchBar.delegate = self
        searchBar.placeholder = "Search Product"
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Names", "Calories"]
        searchBar.selectedScopeButtonIndex = 0
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
        snapshot.appendItems(AppData.filteredItems.map({ $0.id }))
        AppData.dataSource.apply(snapshot)
    }

    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text {
            AppData.searchValue = text.trimmingCharacters(in: .whitespaces)
            prepareSnapshot()
        }
    }

    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        AppData.selectedButton = selectedScope
        prepareSnapshot()
        searchBar.placeholder = selectedScope == 0 ? "Search Product" : "Maximum Calories"
        searchBar.text = ""
    }

}
