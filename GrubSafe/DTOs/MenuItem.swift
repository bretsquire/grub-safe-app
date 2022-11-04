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
    public var descriptions: String?
    public var images: [String]
    public var cost: Double = 1.99
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "menuname"
        case descriptions = "description"
        case images
    }
    
    var dictionaryValue: [String: Any] {
      [
        "id": id as Any,
        "name": name as Any,
        "descriptions": descriptions as Any,
        "images": images
      ]
    }
}
