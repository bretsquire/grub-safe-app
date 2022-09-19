//
//  Menu.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

class Menu {
    // MARK: - Properties
    var menuItems: [MenuItem] = []
    
    init() {
        let porkHotDog = MenuItem(id: "unique-GUID-1",
                                  name: "🌭Pork Hot Dog",
                                  description: "Pork hot dog on a gluten-free bun with mustard and ketchup.",
                                  cost: 1.75,
                                  allergens: nil,
                                  imageName: "porkHotdog")
        let beefHotDog = MenuItem(id: "unique-GUID-2",
                                  name: "🌭Beef Hot Dog",
                                  description: "All beef hot dog on a bun with mustard and ketchup.",
                                  cost: 1.50,
                                  allergens: "Contains: gluten",
                                  imageName: "beefHotdog")
        let frenchFries = MenuItem(id: "unique-GUID-3",
                                  name: "🍟Large French Fries",
                                  description: "All natural thick cut french fries seasoned with salt.",
                                  cost: 1.90,
                                  allergens: nil,
                                  imageName: "fenchFries")
        let iceCream = MenuItem(id: "unique-GUID-4",
                                  name: "🍦Soft Serve Ice Cream",
                                  description: "The creamiest vanilla soft serve ice cream on a cone.",
                                  cost: 1.90,
                                  allergens: "Contains: dairy",
                                  imageName: "iceCream")
        let colaDrink = MenuItem(id: "unique-GUID-5",
                                 name: "🥤Large Cocoa-Cola",
                                 description: nil,
                                 cost: 1.00,
                                 allergens: nil,
                                 imageName: "drink")
        let rootbeerDrink = MenuItem(id: "unique-GUID-6",
                                 name: "🥤Large Root Beer",
                                 description: nil,
                                 cost: 1.00,
                                 allergens: nil,
                                 imageName: "drink")
        addMenuItem(porkHotDog)
        addMenuItem(beefHotDog)
        addMenuItem(frenchFries)
        addMenuItem(iceCream)
        addMenuItem(colaDrink)
        addMenuItem(rootbeerDrink)
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
