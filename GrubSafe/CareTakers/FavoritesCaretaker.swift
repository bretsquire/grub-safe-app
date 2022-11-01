//
//  FavoritesCaretaker.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation

public class FavoritesCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    private let userDefaults = UserDefaults.standard
    private let key = "favorites"
    
    public func save(_ favorites: FavoritesViewModel) throws {
        print(Bundle.main.bundleURL)
        print(FileManager.documentsDirectoryURL)
        
        let data = try encoder.encode(favorites)
        userDefaults.set(data, forKey: key)
    }
    
    public func load() throws -> FavoritesViewModel {
        guard let data = userDefaults.data(forKey: key),
              let favorites = try? decoder.decode(FavoritesViewModel.self, from: data) else {
            throw Error.favoritesNotFound
        }
        return favorites
    }
    
    public enum Error: String, Swift.Error {
        case favoritesNotFound
    }
}
