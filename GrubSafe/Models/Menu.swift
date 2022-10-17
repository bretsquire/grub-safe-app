//
//  Menu.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//
import Combine

public class Menu: Codable, ObservableObject {
    // MARK: - Properties
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
        let porkHotDog = MenuItem(id: "unique-GUID-1",
                                  name: "🌭Pork Hot Dog",
                                  description: "Pork hot dog on a gluten-free bun with mustard and ketchup.",
                                  images: []
        )
        let beefHotDog = MenuItem(id: "unique-GUID-2",
                                  name: "🌭Beef Hot Dog",
                                  description: "All beef hot dog on a bun with mustard and ketchup.",
                                  images: []
        )
        let frenchFries = MenuItem(id: "unique-GUID-3",
                                  name: "🍟Large French Fries",
                                  description: "All natural thick cut french fries seasoned with salt.",
                                   images: []
        )
        let iceCream = MenuItem(id: "unique-GUID-4",
                                  name: "🍦Soft Serve Ice Cream",
                                  description: "The creamiest vanilla soft serve ice cream on a cone.",
                                images: []
        )
        let colaDrink = MenuItem(id: "unique-GUID-5",
                                 name: "🥤Large Cocoa-Cola",
                                 description: nil,
                                 images: []
        )
        let rootbeerDrink = MenuItem(id: "unique-GUID-6",
                                 name: "🥤Large Root Beer",
                                 description: nil,
                                images: []
        )
        menuItems.append(porkHotDog)
        menuItems.append(beefHotDog)
        menuItems.append(frenchFries)
        menuItems.append(iceCream)
        menuItems.append(colaDrink)
        menuItems.append(rootbeerDrink)
    }
    
    // MARK: - Methods
    func fetchMenu() async throws {
        do {
            // MARK: - Assignment #1
            let newMenu = try await menuApi.fetchMenu()
            menuItems = newMenu.menuItems
            
            
            // MARK: - Assignment #2
            await menuDataFileCaretaker.save(self)
            let menuFromDataFile = try menuDataFileCaretaker.load()
            print("*************")
            print("Assignment #2")
            print("*************")
            print("Menu From Data File: first item")
            print(menuFromDataFile.menuItems[0])
            
            await menuPlistCaretaker.save(self)
            let menuFromPlist = try menuPlistCaretaker.load()
            print("*************")
            print("Menu From Plist: first item")
            print(menuFromPlist.menuItems[0])
        } catch {
            throw error
        }
    }
    
    func addMenuItem(_ item: MenuItem) {
        menuItems.append(item)
    }
    
    func printMeals(_ items: [MenuItem]) {
        for item in items where item.description != nil {
            print(item)
        }
    }
}
