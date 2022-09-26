//
//  MenuItem.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

struct MenuItem: Identifiable, Hashable {
    // MARK: - Properties
    let id: String
    let name: String
    let description: String?
    let cost: Double
    let allergens: String?
    let imageName: String?
    
    var costAsString: String {
        get {
            String(format: "$%.02f", cost)
        }
    }
}
