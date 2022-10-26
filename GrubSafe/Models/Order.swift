//
//  Order.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

struct Order {
    var selection: [Item] = []
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
    var descriptions: String {
        get {
            String("The discounted order total is \(discountedTotal) with a \"\(discount.description)\" applied to a order total of \(total)")
        }
    }
    
    static func initDummy() -> Order {
        let menu = MenuViewModel()
        return Order(selection: menu.items)
    }
}
