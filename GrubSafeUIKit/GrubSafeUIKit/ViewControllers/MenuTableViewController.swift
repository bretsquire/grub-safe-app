//
//  MenuTableViewController.swift
//  GrubSafeUIKit
//
//  Created by Bret Squire on 9/11/22.
//

import SwiftUI
import UIKit

class MenuTableViewController: UITableViewController {
    
    let menu = Menu()
    
    @IBSegueAction func showMenuItemView(_ coder: NSCoder) -> UIViewController? {
        guard let row = tableView.indexPathForSelectedRow?.row else { return nil }
        let item = menu.menuItems[row]
        let menuItemView = MenuItemView(item: item)
        return UIHostingController(coder: coder, rootView: menuItemView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menu.menuItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
        
        let menuItem = menu.menuItems[indexPath.row]
        cell.textLabel?.text = "\(menuItem.name) \(menuItem.costAsString)"
        return cell
    }

}
