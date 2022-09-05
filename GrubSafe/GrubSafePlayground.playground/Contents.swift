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
var itemPrices = [1.99, 2.99, 3.25, 0.99, 1.75, 6.99]
var totalAmount = itemPrices.reduce(0, +)
var discountPercentage = 0.1
var discountType = "Thanksgiving discount (10%)"

//: ## Assignmet 1: Function
func totalAfterDiscount(totalAmount: Double, discountPercentage: Double) -> Double {
    let discountedAmount = totalAmount * discountPercentage
    return totalAmount - discountedAmount
}

var totalAmountAfterDiscount = totalAfterDiscount(totalAmount: totalAmount, discountPercentage: discountPercentage)
print("\nAssignment 1:\n \(totalAmountAfterDiscount) = \(totalAmount) - (\(totalAmount) * \(discountPercentage))")

//: ## Assignmet 2: Function
func totalAfterDiscount(totalAmount: Double) -> Double {
    let discountedAmount = totalAmount * discountPercentage
    return totalAmount - discountedAmount
}

totalAmountAfterDiscount = totalAfterDiscount(totalAmount: totalAmount)
print("\nAssignment 2:\n \(totalAmountAfterDiscount) = \(totalAmount) - (\(totalAmount) * \(discountPercentage)   Default Discount")

//: ## Assignmet 3: typealias
typealias ApplyDiscount = (Double, String) -> Double
func printDiscount(applyDiscount: ApplyDiscount, for total: Double, with discount: String) {
    let discountedTotal = applyDiscount(total, discount)
    print("A \(discount) discount applied to \(total) is \(discountedTotal)")
}

func testApplyDiscount(totalAmount: Double, discountType: String) -> Double {
    // pretend for now it will get double value from discountType string
    return totalAfterDiscount(totalAmount: totalAmount)
}
print("\nAssignment 3:")
printDiscount(applyDiscount: testApplyDiscount, for: totalAmount, with: discountType)

//: ## Assignmet 4: Closure
let applyDiscount = { (totalAmount: Double, discountType: String) -> Double in
    // pretend for now it will get double value from discountType string
    return totalAfterDiscount(totalAmount: totalAmount)
}

totalAmount = 2.99
print("\nAssignment 4:")
printDiscount(applyDiscount: testApplyDiscount, for: totalAmount, with: discountType)

//: ## Assignmet 5: Map
print("\nAssignment 5:")
itemPrices = itemPrices.map {
    let newPrices = $0 * 0.5
    print("The new price for \($0) is now \(newPrices)")
    return newPrices
}

//: ## Assignmet 6: Sorted
let discountTypes = ["Default discount (5%)": 0.05, "Thanksgiving discount (10%)": 0.1, "Christmas discount (15%)": 0.15, "New year discount (20%)": 0.2]
print("\nAssignment 6:")
print("unsorted discounts \(discountTypes)")

let sortedDiscountTypes = discountTypes.sorted {
    $0.value > $1.value
}

print("sorted discounts \(sortedDiscountTypes)")

//: ## Assignmet 7: Enums and Switch cases
enum DiscountTypes: String {
    case `default` = "Default discount (5%)"
    case thanksgiving = "Thanksgiving discount (10%)"
    case christmas = "Christmas discount (15%)"
    case newYear = "New year discount (20%)"
    
    func printDiscount(discountType: DiscountTypes) {
        var discountPercentage: Double
        switch discountType {
        case .`default`:
            discountPercentage = 0.05
        case .thanksgiving:
            discountPercentage = 0.10
        case .christmas:
            discountPercentage = 0.15
        case .newYear:
            discountPercentage = 0.20
        }
        print("the discount value is \(discountPercentage) for \(discountType.rawValue)")
    }
}

print("\nAssignment 7:")
let discount = DiscountTypes(rawValue: discountType) ?? .default
discount.printDiscount(discountType: discount)

//: ## Assignmet 8: Computed property
struct MenuOrder {
    var itemPrices = [1.99, 2.99, 3.25, 0.99, 1.75, 6.99]
    var currentDiscount = 0.15
    var currentDiscountedAmount: Double {
        get {
            let total = itemPrices.reduce(0, +)
            return totalAfterDiscount(totalAmount: total, discountPercentage: currentDiscount)
        }
    }
}

let menuOrder = MenuOrder.init()
var currentDiscountedAmount = menuOrder.currentDiscountedAmount
print("\nAssignment 8:\n the current discount amount is \(currentDiscountedAmount)")

//: ## Assignmet 9: Lazy property
struct Discounts {
    var discountTypes = ["Default discount (5%)": 0.05, "Thanksgiving discount (10%)": 0.1, "Christmas discount (15%)": 0.15, "New year discount (20%)": 0.2]
    lazy var maxDiscount = discountTypes.values.max() ?? 0.0
}

var discounts = Discounts.init()
print("\nAssignment 9:\nThe max discount is \(discounts.maxDiscount) for \(discounts.discountTypes) ")
discounts.discountTypes = ["Default discount (5%)": 0.05, "Thanksgiving discount (10%)": 0.1, "Christmas discount (15%)": 0.15]
print("Note the lazy property max discount \(discounts.maxDiscount) does not change for \(discounts.discountTypes) ")

//: ## Assignmet 10: Method
struct UserOrder {
    var itemPrices = [1.99, 2.99, 3.25, 0.99, 1.75, 6.99]
    var currentDiscount = 0.15
    var currentDiscountedAmount: Double {
        get {
            let total = itemPrices.reduce(0, +)
            return self.totalAmountAfterApplyingDiscount(totalAmount: total, discountPercentage: currentDiscount)
        }
    }
    
    func totalAmountAfterApplyingDiscount(totalAmount: Double, discountPercentage: Double) -> Double {
        let discountedAmount = totalAmount * discountPercentage
        return totalAmount - discountedAmount
    }
}

let userOrder = UserOrder.init()
currentDiscountedAmount = userOrder.currentDiscountedAmount
print("\nAssignment 10:\n the total discounted amount is \(currentDiscountedAmount)")

//: ## Assignmet 13: Final code reasoning
/*:
 I think there will need to be two new objects to add:
 * Discount
 * Order
 
 The Discount object will be an Enum that contains:
 * the discountPercentage as the raw values
 * a computed property to return the human readable description of the discount
 * a method to take in a total and return the total with current discount applied
 
 The Order object will be an Struct that contains:
 * an array property for menu items selected
 * a property for current discount
 * a property for total set by a property observer on the selection property
 * a computed property for discounted total
 * a method for printing out order total, discount applied and total after discount
 */
enum Discount: Double {
    case `default` = 0.05
    case thanksgiving = 0.10
    case christmas = 0.15
    case newYear = 0.20

    var description: String {
        get {
            switch self {
            case .`default`:
                return "Default discount (5%)"
            case .thanksgiving:
                return "Thanksgiving discount (10%)"
            case .christmas:
                return "Christmas discount (15%)"
            case .newYear:
                return "New year discount (20%)"
            }
        }
    }
    
    func applyDiscount(_ total: Double) -> Double {
        return total - total * self.rawValue
    }
}

let discountEnum: Discount = .thanksgiving
let discountTotal = discountEnum.applyDiscount(totalAmount)
print("\nAssignment 13:\nThe discount total is \(discountTotal) by applying \(discountEnum.description) to \(totalAmount) ")

struct Order {
    var total = 0.0
    var selection: [MenuItem] = [] {
        didSet {
            total = 0.0
            selection.forEach { item in
                total += item.cost
            }
        }
    }
    var discount: Discount = .`default`
    var discountedTotal: Double {
        get {
            discount.applyDiscount(total)
        }
    }
    
    func printOrder() {
        print("The discounted order total is \(discountedTotal) with a \(discount.description) applied to a order total of \(total)")
    }
}

let menu = Menu.init()
let userSelection = menu.menuItems
var order = Order.init()
order.selection = userSelection
order.discount = .thanksgiving
order.printOrder()
