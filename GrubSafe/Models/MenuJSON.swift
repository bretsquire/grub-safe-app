//
//  Menu.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//
import Combine

public class MenuJSON: Codable, ObservableObject {
    // MARK: - Properties
    var menuItems: [MenuItem] = []
    
    enum CodingKeys: String, CodingKey {
        case menuItems = "Result"
    }
    
    init() {
        let porkHotDog = MenuItem(id: "unique-GUID-1",
                                  name: "🌭Pork Hot Dog",
                                  descriptions: "Pork hot dog on a gluten-free bun with mustard and ketchup.",
                                  images: []
        )
        let beefHotDog = MenuItem(id: "unique-GUID-2",
                                  name: "🌭Beef Hot Dog",
                                  descriptions: "All beef hot dog on a bun with mustard and ketchup.",
                                  images: []
        )
        let frenchFries = MenuItem(id: "unique-GUID-3",
                                   name: "🍟Large French Fries",
                                   descriptions: "All natural thick cut french fries seasoned with salt.",
                                   images: []
        )
        let iceCream = MenuItem(id: "unique-GUID-4",
                                name: "🍦Soft Serve Ice Cream",
                                descriptions: "The creamiest vanilla soft serve ice cream on a cone.",
                                images: []
        )
        let colaDrink = MenuItem(id: "unique-GUID-5",
                                 name: "🥤Large Cocoa-Cola",
                                 descriptions: nil,
                                 images: []
        )
        let rootbeerDrink = MenuItem(id: "unique-GUID-6",
                                     name: "🥤Large Root Beer",
                                     descriptions: nil,
                                     images: []
        )
        menuItems.append(porkHotDog)
        menuItems.append(beefHotDog)
        menuItems.append(frenchFries)
        menuItems.append(iceCream)
        menuItems.append(colaDrink)
        menuItems.append(rootbeerDrink)
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
