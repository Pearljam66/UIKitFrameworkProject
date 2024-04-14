//
//  EditItemViewController.swift
//  UIKitFrameworkProject
//
//  Created by Sarah Clark on 4/14/24.
//

import UIKit

class EditItemViewController: UIViewController {
    @IBOutlet weak var newName: UITextField!
    var selected: ItemsData!

    override func viewDidLoad() {
        super.viewDidLoad()

        if selected != nil {
            newName.text = selected.name
            newName.becomeFirstResponder()
        }
    }

    @IBAction func saveItem(_ sender: UITextField) {
        var text = newName.text!
        text = text.trimmingCharacters(in: .whitespaces)
        if text != "" {
            let lower = text.lowercased()
            let final = lower.capitalized
            selected.name = final

            var currentSnapshot = AppData.dataSource.snapshot()
            currentSnapshot.reloadItems([selected.id])
            AppData.dataSource.apply(currentSnapshot)

            navigationController?.popViewController(animated: true)
        }
    }
}
