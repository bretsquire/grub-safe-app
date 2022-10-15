//
//  MenuItem.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//

public struct MenuItem: Identifiable, Hashable, Codable {
    // MARK: - Properties
    public let id: String
    public var name: String
    public var description: String?
    public var images: [String]
    public var cost: Double = 1.99
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "menuname"
        case description
        case images
    }
    
    var costAsString: String {
        get {
            String(format: "$%.02f", 1.99)
        }
    }
}
