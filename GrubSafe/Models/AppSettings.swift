//
//  AppSettings.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation

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
              return try favoritesCaretaker.load()
          } catch {
              // TODO alert user favorites could not be restored
              return Favorites()
          }
      } set {
          do {
              try favoritesCaretaker.save(newValue)
          } catch {
              // TODO alert user favorites could not be saved
          }
      }
    }
    
}
