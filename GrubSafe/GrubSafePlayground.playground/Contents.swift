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
var menuItems: [MenuItemA] = []
menuItems.append(hotdog)
print("\n****** Assignment 2 ******")
print(menuItems)

//: ## Assignmet 3:
struct MenuItem {
    let id: String
    let name: String
    let description: String?
    let cost: Double
    let allergens: String?
}
let porkHotDog = MenuItem(id: "unique-GUID-1234",
                          name: "Pork Hot Dog",
                          description: "Pork hot dog on a gluten-free bun with mustard and ketchup.",
                          cost: 1.50,
                          allergens: nil)
print("\n****** Assignment 3 ******")
print(porkHotDog)
