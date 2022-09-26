//
//  Favorites.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation

struct Favorites {
    var items: [MenuItem] = []
    
    static func initDummy() -> Favorites {
        let menu = Menu()
        return Favorites(items: menu.menuItems)
    }
}
