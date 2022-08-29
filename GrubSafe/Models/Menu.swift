//
//  Menu.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

struct Menu {
    // MARK: - Properties
    var menuItems: [MenuItem] = []
    
    // MARK: - Mutating Methods
    mutating func addMenuItem(_ item: MenuItem) {
        menuItems.append(item)
    }
    
    // MARK: - Methods
    func printMeals(_ items: [MenuItem]) {
        for item in items where item.description != nil {
            print(item)
        }
    }
}
