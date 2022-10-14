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
                                  //cost: 1.75,
                                  //allergens: nil,
                                  //imageName: "porkHotdog"
                                  images: []
        )
        let beefHotDog = MenuItem(id: "unique-GUID-2",
                                  name: "🌭Beef Hot Dog",
                                  description: "All beef hot dog on a bun with mustard and ketchup.",
                                  //cost: 1.50,
                                  //allergens: "Contains: gluten",
                                  //imageName: "beefHotdog"
                                  images: []
        )
        let frenchFries = MenuItem(id: "unique-GUID-3",
                                  name: "🍟Large French Fries",
                                  description: "All natural thick cut french fries seasoned with salt.",
                                  //cost: 1.90,
                                  //allergens: nil,
                                  //imageName: "frenchFries"
                                   images: []
        )
        let iceCream = MenuItem(id: "unique-GUID-4",
                                  name: "🍦Soft Serve Ice Cream",
                                  description: "The creamiest vanilla soft serve ice cream on a cone.",
                                  //cost: 1.90,
                                  //allergens: "Contains: dairy",
                                  //imageName: "iceCream"
                                images: []
        )
        let colaDrink = MenuItem(id: "unique-GUID-5",
                                 name: "🥤Large Cocoa-Cola",
                                 description: nil,
                                 //cost: 1.00,
                                 //allergens: nil,
                                 //imageName: "drink"
                                 images: []
        )
        let rootbeerDrink = MenuItem(id: "unique-GUID-6",
                                 name: "🥤Large Root Beer",
                                 description: nil,
                                 //cost: 1.00,
                                 //allergens: nil,
                                 //imageName: "drink"
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
