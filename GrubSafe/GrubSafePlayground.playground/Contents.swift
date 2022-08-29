//: # Week 2 Homework Assignment - Minimal contact restaurant App

//: ## Assignmet 1:
struct MenuItemA {
    let id: String
    let name: String
    let description: String
    let cost: Double
    let allergens: String
}

let hotdog = MenuItemA(id: "unique-GUID-123",
                      name: "Beef Hot Dog",
                      description: "All beef hot dog on a bun with mustard and ketchup.",
                      cost: 1.50,
                      allergens: "Contains: gluten")

print("****** Assignment 1 ******")
print(hotdog)

//: ## Assignmet 2:
var menuItemsA: [MenuItemA] = []
menuItemsA.append(hotdog)

print("\n****** Assignment 2 ******")
print(menuItemsA)

//: ## Assignmet 3:
struct MenuItem {
    let id: String
    let name: String
    let description: String?
    let cost: Double
    let allergens: String?
}

let porkHotDog = MenuItem(id: "unique-GUID-1",
                          name: "Pork Hot Dog",
                          description: "Pork hot dog on a gluten-free bun with mustard and ketchup.",
                          cost: 1.75,
                          allergens: nil)

print("\n****** Assignment 3 ******")
print(porkHotDog)

//: ## Assignmet 4:
let beefHotDog = MenuItem(id: "unique-GUID-2",
                          name: "Beef Hot Dog",
                          description: "All beef hot dog on a bun with mustard and ketchup.",
                          cost: 1.50,
                          allergens: "Contains: gluten")
let frenchFries = MenuItem(id: "unique-GUID-3",
                          name: "Large French Fries",
                          description: "All natural thick cut french fries seasoned with salt.",
                          cost: 1.90,
                          allergens: nil)
let iceCream = MenuItem(id: "unique-GUID-4",
                          name: "Soft Serve Ice Cream",
                          description: "The creamiest vanilla soft serve ice cream on a cone.",
                          cost: 1.90,
                          allergens: "Contains: dairy")
let colaDrink = MenuItem(id: "unique-GUID-5",
                         name: "Large Cocoa-Cola",
                         description: nil,
                         cost: 1.00,
                         allergens: nil)
let rootbeerDrink = MenuItem(id: "unique-GUID-6",
                         name: "Large Root Beer",
                         description: nil,
                         cost: 1.00,
                         allergens: nil)
print("\n****** Assignment 4 ******")
print(porkHotDog)
print(beefHotDog)
print(frenchFries)
print(iceCream)
print(colaDrink)
print(rootbeerDrink)

//: ## Assignmet 5:
var menuItems: [MenuItem] = []

func addMenuItem(_ item: MenuItem) {
    menuItems.append(item)
}
addMenuItem(porkHotDog)
addMenuItem(beefHotDog)
addMenuItem(frenchFries)
addMenuItem(iceCream)
addMenuItem(colaDrink)
addMenuItem(rootbeerDrink)
print("\n****** Assignment 5 ******")
print(menuItems)
