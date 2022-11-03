//
//  MenuViewModel.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/26/22.
//

import Foundation

public class MenuViewModel: ObservableObject {
    // MARK: - Properties
    @Published var items: [Item] = []
    var sortBy = 0 {
        didSet {
            let descriptor = sortTypes[sortBy].descriptors
            items = PersistenceController.shared.fetchMenuItems(sortBy: descriptor)
        }
    }
    private var isPreview = false
    
    // MARK: - Menu Api
    private var menuApi = MenuApi()

    init() {
    }
    
    static func initPreview() -> MenuViewModel {
        let menu = MenuViewModel()
        menu.isPreview = true
        Task {
            do {
                try await menu.fetchMenuItems()
            } catch {
                print(error)
            }
        }
        return menu
    }
    
    // MARK: - Methods
    func fetchMenuItems() async throws {
        let newMenu: MenuJSON
        do {
            if isPreview {
                newMenu = try await menuApi.getMenuItemsForPreview()
            } else {
                // TODO: create my own local server endpoint
                //newMenu = MenuJSON()
                //newMenu = try await menuApi.getMenuItems()
                newMenu = try await menuApi.getMenuItemsForPreview()
                
            }
            try await PersistenceController.addMenu(menu: newMenu)
            await MainActor.run {
                items = PersistenceController.shared.fetchMenuItems()
            }
        } catch {
            throw error
        }
    }
    
    let sortTypes = [
      (name: "Name Asc", descriptors: NSSortDescriptor(key: "name", ascending: true)),
      (name: "Name Dec", descriptors: NSSortDescriptor(key: "name", ascending: false))
    ]
}
