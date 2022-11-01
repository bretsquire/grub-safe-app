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
                print("CONNECTED")
                self.hasInternetAccess =  true
            } else {
                print("NOT_CONNECTED")
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
    private var favoritesCaretaker = FavoritesCaretaker()
    public var favorites: FavoritesViewModel {
      get {
          do {
              return try favoritesCaretaker.load()
          } catch {
              // TODO alert user favorites could not be restored
              return FavoritesViewModel()
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
