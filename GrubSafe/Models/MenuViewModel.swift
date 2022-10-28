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
    
    // MARK: - Menu Api
    private var menuApi = MenuApi()

    init() {
    }
    
    // MARK: - Methods
    func fetchMenuItems() async throws {
        do {
            let newMenu = try await menuApi.getMenuItems()
            try await PersistenceController.addMenu(menu: newMenu)
            items = PersistenceController.shared.fetchMenuItems()
        } catch {
            throw error
        }
    }
    
    let sortTypes = [
      (name: "Name Asc", descriptors: NSSortDescriptor(key: "name", ascending: true)),
      (name: "Name Dec", descriptors: NSSortDescriptor(key: "name", ascending: false))
    ]
}
