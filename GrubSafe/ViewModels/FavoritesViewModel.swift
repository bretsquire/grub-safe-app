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
    
//    mutating func replaceWith(_ items: [Item]) {
//        itemIds = Set(items.map { $0.id })
//    }
    
    static func initDummy() -> FavoritesViewModel {
        let setOfItemIds: Set<String> = ["1","2","3"]
        return FavoritesViewModel(itemIds: setOfItemIds)
    }
    
    static func initPreview() -> FavoritesViewModel {
        let setOfItemIds: Set<String> = ["5f5eccf4e923d0aca3e7d442","5f5eccf4e923d0aca3e7d441","5f5eccf4e923d0aca3e7d445"]
        return FavoritesViewModel(itemIds: setOfItemIds)
    }
}
