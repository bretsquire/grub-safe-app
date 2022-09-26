//
//  AppSettings.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation

// MARK: - Singleton Pattern: Singleton
public class AppSettings {
    // MARK: - Object Lifecycle
    private init() { }
    
    // MARK: - Static Properties
    static let shared = AppSettings()
    
    // MARK: - Instance Properties
    private var favoritesCaretaker = FavoritesCaretaker()
    public var favorites: Favorites {
      get {
          do {
              // MARK: - Memento Pattern: load favorites
              return try favoritesCaretaker.load()
          } catch {
              // TODO alert user favorites could not be restored
              // MARK: - Memento Pattern: store favorites
              return Favorites()
          }
      } set {
          do {
              try favoritesCaretaker.save(newValue)
          } catch {
              //
          }
      }
    }
    
}
