//
//  Item+CoreDataClass.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/25/22.
//
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    public var cost: Double = 1.99
}
