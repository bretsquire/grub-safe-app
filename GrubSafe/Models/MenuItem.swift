//
//  MenuItem.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

public struct MenuItem: Identifiable, Hashable, Codable {
    // MARK: - Properties
    public let id: String
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
