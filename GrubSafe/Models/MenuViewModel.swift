//
//  MenuViewModel.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/26/22.
//

import Foundation

public class MenuViewModel: Codable, ObservableObject {
    // MARK: - Properties
    var items: [Item] = []
    var menuItems: [MenuItem] = []
    
    // MARK: - Menu Api
    private var menuApi = MenuApi()
    
    // MARK: - Assignment #2 Data and Plist caretakers
    private var menuDataFileCaretaker = MenuDataFileCaretaker()
    private var menuPlistCaretaker = MenuPlistCaretaker()
    
    enum CodingKeys: String, CodingKey {
        case menuItems = "Result"
    }
    
    init() {
        
    }
    
    // MARK: - Methods
    func fetchMenuItems() async throws {
        do {
            // MARK: - Assignment #1
            let newMenu = try await menuApi.getMenuItems()
            menuItems = newMenu.menuItems
            
            // MARK: - Assignment #2
            await menuDataFileCaretaker.save(newMenu)
            let menuFromDataFile = try menuDataFileCaretaker.load()
            print("*************")
            print("Assignment #2")
            print("*************")
            print("Menu From Data File: first item")
            print(menuFromDataFile.menuItems[0])
            
            await menuPlistCaretaker.save(newMenu)
            let menuFromPlist = try menuPlistCaretaker.load()
            print("*************")
            print("Menu From Plist: first item")
            print(menuFromPlist.menuItems[0])
            
            // MARK: - Assignment #3
            try await PersistenceController.getMenuItems()
            items = PersistenceController.shared.fetchMenuItems()
        } catch {
            throw error
        }
    }
    
    func addMenuItem(_ item: MenuItem) {
        menuItems.append(item)
    }
    
    func printMeals(_ items: [MenuItem]) {
        for item in items where item.descriptions != nil {
            print(item)
        }
    }
}
