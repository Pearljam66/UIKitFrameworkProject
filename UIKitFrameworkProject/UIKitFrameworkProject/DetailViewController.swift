//
//  DetailViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/12/24.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var nutritionItem: UITextView!

    var selected: ItemsData!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if selected != nil {
            titleItem.text = selected.name
            imageItem.image = UIImage(named: selected.image)
            nutritionItem.text = "Calories: \(selected.calories)"
        }
    }

    @IBAction func deleteItem(_ sender: UIButton) {
        if selected != nil {
            AppData.items.removeAll(where: { $0.id == selected.id })

            var currentSnapshot = AppData.dataSource.snapshot()
            currentSnapshot.deleteItems([selected.id])
            AppData.dataSource.apply(currentSnapshot)

            navigationController?.popViewController(animated: true)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showEditItem" {
            let controller = segue.destination as! EditItemViewController
            controller.selected = selected
        }
    }

}
