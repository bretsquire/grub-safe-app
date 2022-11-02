//
//  OrderViewModel.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/5/22.
//

import Foundation

public class OrderViewModel: ObservableObject {
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
            String("The discounted order total is \(discountedTotal) with a \"\(discount.description)\" applied to a order total of \(total)")
        }
    }
    
    init() { }
    
    init(selection: [Item]) {
        self.selection = selection
    }
    
    static func initDummy() -> OrderViewModel {
        let menu = MenuViewModel()
        return OrderViewModel(selection: menu.items)
    }
}
