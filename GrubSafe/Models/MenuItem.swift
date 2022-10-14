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
    let images: [String]
    //let v: Int
    let cost: Double = 1.99
    //let allergens: String?
    //let imageName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "menuname"
        case description
        case images
        //case v = "__v"
    }
    
    var costAsString: String {
        get {
            String(format: "$%.02f", 1.99)
        }
    }
}
