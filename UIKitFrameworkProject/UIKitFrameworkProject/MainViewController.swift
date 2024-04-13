//
//  MainViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/11/24.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var daTable: UITableView!
    var selected: ItemsData!

    override func viewDidLoad() {
        super.viewDidLoad()
        daTable.delegate = self
        daTable.register(UITableViewCell.self, forCellReuseIdentifier: "daCell")

        prepareDataSource()
        prepareSnapshot()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if let path = daTable.indexPathForSelectedRow {
            daTable.deselectRow(at: path, animated: true)
        }
    }

    @IBAction func editList(_ sender: UIBarButtonItem) {
        if daTable.isEditing {
            daTable.setEditing(false, animated: true)
        } else {
            daTable.setEditing(true, animated: true)
        }
    }

    func prepareDataSource() {
        AppData.dataSource = MyDataSource(tableView: daTable) { tableView, indexPath, itemID in
            let cell = tableView.dequeueReusableCell(withIdentifier: "daCell", for: indexPath)

            if let item = AppData.items.first(where: { $0.id == itemID }) {
                var config = cell.defaultContentConfiguration()
                config.text = item.name
                cell.contentConfiguration = config
            }
            return cell
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            let controller = segue.destination as! DetailViewController
            controller.selected = selected
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
                selected = item
            }
        }
        performSegue(withIdentifier: "showDetails", sender: self)
    }

}
