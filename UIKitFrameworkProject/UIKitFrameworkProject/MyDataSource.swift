//
//  MyDataSource.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class MyDataSource: UITableViewDiffableDataSource<Sections.ID, ItemsData.ID> {

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return AppData.sections[section].name
    }

    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        let titles = AppData.sections.map({ $0.name })
        return titles
    }

    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        if let index = AppData.sections.firstIndex(where: { $0.name == title }) {
            return index
        }
        return 0
    }

}
