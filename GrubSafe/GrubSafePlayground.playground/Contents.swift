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

//: ## Assignmet 2: Function
func totalAfterDiscount(totalAmount: Double) -> Double {
    let discountPercentage = 0.05
    let discountedAmount = totalAmount * discountPercentage
    return totalAmount - discountedAmount
}

totalAmountAfterDiscount = totalAfterDiscount(totalAmount: 1.99)
print("Assignment 2:\n \(totalAmountAfterDiscount) = 1.99 - (1.99 * 0.05)   5% Default Discount")
