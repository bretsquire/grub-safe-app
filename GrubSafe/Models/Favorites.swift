//
//  Favorites.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation

public struct Favorites: Codable {
    private var items = Set<MenuItem>()
    
    func isFavorite(_ item: MenuItem) -> Bool {
        items.contains(item)
    }
    
    mutating func toggle(_ item: MenuItem) {
        if items.contains(item) {
            items.remove(item)
        } else {
            items.insert(item)
        }
    }
    
    static func initDummy() -> Favorites {
        let menu = Menu()
        let setOfItems = Set(menu.menuItems)
        return Favorites(items: setOfItems)
    }
}

// MARK: - Interator Pattern: Conforms to interator
extension Favorites: Sequence {
    public func makeIterator() -> IndexingIterator<[MenuItem]> {
        return Array(items).makeIterator()
    }
}
