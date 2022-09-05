//: # Week 3 Homework Assignment - Minimal contact restaurant App
/*:
 Properties/ Data/ Formulae:
 * itemPrices: An array containing prices of 7 (or any number of) items.
 * totalAmount: Total amount of all items before applying discount. (A single value.)
 * discountPercentage: A percentage discount number. For example: 5%, 10%.
 * discountType: Type of discount to be applied on an item. Discount types could be Default discount (5%), Thanksgiving discount (10%), Christmas discount (15%), New year discount (20%).
 * discountedAmount: Amount after applying discount on totalAmount. Formula: totalAmount * 0.05 (if a discount of 5% is applied).
 * totalAmountAfterDiscount: total Amount - discountedAmount.
 */
//: ## Assignmet 1: Function
func totalAfterDiscount(totalAmount: Double, discountPercentage: Double) -> Double {
    let discountedAmount = totalAmount * discountPercentage
    return totalAmount - discountedAmount
}

var totalAmountAfterDiscount = totalAfterDiscount(totalAmount: 1.99, discountPercentage: 0.1)
print("Assignment 1:\n \(totalAmountAfterDiscount) = 1.99 - (1.99 * 0.1)")



















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

//: ## Assignmet 6:
func printMeals(_ items: [MenuItem]) {
    for item in items where item.description != nil {
        print(item)
    }
}

print("\n****** Assignment 6 ******")
printMeals(menuItems)
