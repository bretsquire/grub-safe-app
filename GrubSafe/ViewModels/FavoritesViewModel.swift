//
//  FavoritesViewModel.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation

public struct FavoritesViewModel: Codable {
    private var itemIds = Set<String>()
    
    func isFavorite(_ item: Item) -> Bool {
        itemIds.contains(item.id)
    }
    
    func items(_ items: [Item]) -> [Item] {
        items.filter {
            isFavorite($0)
        }
    }
    
    mutating func toggle(_ item: Item) {
        if itemIds.contains(item.id) {
            itemIds.remove(item.id)
        } else {
            itemIds.insert(item.id)
        }
    }
    
    static func initDummy() -> FavoritesViewModel {
        let setOfItemIds: Set<String> = ["1","2","3"]
        return FavoritesViewModel(itemIds: setOfItemIds)
    }
    
    static func initPreview() -> FavoritesViewModel {
        let setOfItemIds: Set<String> = ["01","02","03"]
        return FavoritesViewModel(itemIds: setOfItemIds)
    }
}
