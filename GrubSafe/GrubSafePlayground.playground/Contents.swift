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
print(hotdog)

//: ## Assignmet 2:
var menuItems: [MenuItemA] = []
menuItems.append(hotdog)
print(menuItems)
