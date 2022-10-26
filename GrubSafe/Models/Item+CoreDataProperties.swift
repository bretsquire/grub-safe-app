//
//  Item+CoreDataProperties.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/25/22.
//
//

import Foundation
import CoreData

extension Item {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var descriptions: String?
    @NSManaged public var images: [String]
    
    var costAsString: String {
        get {
            String(format: "$%.02f", 1.99)
        }
    }
}

extension Item : Identifiable {

}
