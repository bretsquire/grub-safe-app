//
//  AppSettings.swift
//  GrubSafe
//
//  Created by Bret Squire on 9/26/22.
//

import Foundation
import Network

public class AppSettings: ObservableObject {
    // MARK: - Object Lifecycle
    private init() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.hasInternetAccess =  true
            } else {
                self.hasInternetAccess =  false
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
    
    // MARK: - Static Properties
    static let shared = AppSettings()
    
    // MARK: - Instance Properties
    private let monitor = NWPathMonitor()
    @Published var hasInternetAccess = true
    private var favoritesStore = FavoritesStore()
    public var favorites: FavoritesViewModel {
      get {
          do {
              return try favoritesStore.load()
          } catch {
              return FavoritesViewModel()
          }
      } set {
          do {
              try favoritesStore.save(newValue)
          } catch {
              // TODO alert user favorites could not be saved
          }
      }
    }
    
    
}
