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
print("\nAssignment 1:\n \(totalAmountAfterDiscount) = 1.99 - (1.99 * 0.1)")

//: ## Assignmet 2: Function
func totalAfterDiscount(totalAmount: Double) -> Double {
    let discountPercentage = 0.05
    let discountedAmount = totalAmount * discountPercentage
    return totalAmount - discountedAmount
}

totalAmountAfterDiscount = totalAfterDiscount(totalAmount: 1.99)
print("\nAssignment 2:\n \(totalAmountAfterDiscount) = 1.99 - (1.99 * 0.05)   5% Default Discount")

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
var totalAmount = 1.99
var discountType = "Default discount (5%)"
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
var itemPrices = [1.99, 2.99, 3.25, 0.99, 1.75, 6.99]
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
