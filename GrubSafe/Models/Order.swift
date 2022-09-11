//
//  Order.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

struct Order {
    var selection: [MenuItem] = []
    var total: Double {
        get {
            var total = 0.0
            selection.forEach { item in
                total += item.cost
            }
            return total
        }
    }
    var discount: Discount = .`default`
    var discountedTotal: Double {
        get {
            discount.applyDiscount(total)
        }
    }
    var description: String {
        get {
            String("The discounted order total is \(discountedTotal) with a \"\(discount.description)\" applied to a order total of \(total)")
        }
    }
}

let menu = Menu()
var order = Order(selection: menu.menuItems)