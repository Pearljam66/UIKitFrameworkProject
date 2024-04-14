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
}
