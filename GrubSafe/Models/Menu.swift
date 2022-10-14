//
//  Menu.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

class Menu: Codable {
    // MARK: - Properties
    let itemsCount: Int
    var menuItems: [MenuItem] = []
    
    enum CodingKeys: String, CodingKey {
        case itemsCount = "Total Menu"
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
        itemsCount = menuItems.count
    }
    
    // MARK: - Methods
    func addMenuItem(_ item: MenuItem) {
        menuItems.append(item)
    }
    
    func printMeals(_ items: [MenuItem]) {
        for item in items where item.description != nil {
            print(item)
        }
    }
}
