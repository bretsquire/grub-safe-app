//
//  OrderViewModel.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

import Foundation

struct OrderViewModel {
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
    var discount: DiscountViewModel = .`default`
    var discountedTotal: Double {
        get {
            discount.applyDiscount(total)
        }
    }
    var descriptions: String {
        get {
            let discountString = String(format: "%.2f", discountedTotal)
            let totalString = String(format: "%.2f", total)
            return String("The discounted order total is $\(discountString) with a \"\(discount.description)\" applied to a order total of $\(totalString)")
        }
    }
    
    public func itemsCount(_ item: Item) -> Int {
        let items = selection.filter { $0.id == item.id }
        return items.count
    }
    
    public mutating func add(_ item: Item) {
        selection.append(item)
    }
    
    public mutating func subtract(_ item: Item) {
        if let idx = selection.firstIndex(where: { $0.id == item.id }) {
            selection.remove(at: idx)
        }
    }
    
    static func initDummy() -> OrderViewModel {
        let menu = MenuViewModel()
        return OrderViewModel(selection: menu.items)
    }
    
    static func initPreview() -> OrderViewModel {
        let menu = MenuViewModel.initPreview()
        var order = OrderViewModel()
        order.selection = Array(menu.items[0...2])
        return order
    }
}
