//
//  Persistence.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/17/22.
//

import CoreData

enum MenuDBError: Error {
  case batchInsertError
}

struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for i in 0..<25 {
            let id = String(format: "%02d", i + 1)
            let item = Item(context: viewContext)
            item.id = "\(id)"
            item.name = "Item Name \(id)"
            item.descriptions = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
            item.images = [
                "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/x4cspjvzqn2qk76sjhiw.jpg",
                "https://res.cloudinary.com/jobizil/image/upload/v1602768183/images/menus/xnurgo60mme1ewupfbin.jpg",
                "https://res.cloudinary.com/jobizil/image/upload/v1602768184/images/menus/ovni4qwzzxbufpsurlsg.jpg"
              ]
        }
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MenuDB")
        if inMemory {
            // swiftlint:disable:next force_unwrapping
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        
        container.viewContext.name = "viewContext"
        /// - Tag: viewContextMergePolicy
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        container.viewContext.undoManager = nil
        container.viewContext.shouldDeleteInaccessibleFaults = true
    }
    
    private func newTaskContext() -> NSManagedObjectContext {
        let taskContext = container.newBackgroundContext()
        taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return taskContext
    }
    
    private func createBatchInsertMenuItemsRequest(from menuItems: [MenuItem]) -> NSBatchInsertRequest {
        var index = 0
        let total = menuItems.count
        
        let batchInsertRequest = NSBatchInsertRequest(entity: Item.entity(), dictionaryHandler: { dictionary in
            guard index < total else { return true }
            dictionary.addEntries(from: menuItems[index].dictionaryValue as [AnyHashable: Any])
            index += 1
            return false
        })
        return batchInsertRequest
    }
    
    func importMenuItems(from menuItems: [MenuItem]) async throws {
        let taskContext = newTaskContext()
        taskContext.name = "importContext"
        taskContext.transactionAuthor = "importMenuItems"
        print("number of menu items \(menuItems.count)")
        
        try taskContext.performAndWait {
            let deleteRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Item")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: deleteRequest)
            do {
                try taskContext.execute(batchDeleteRequest)
            } catch {
                throw MenuDBError.batchInsertError
            }
        }

        try taskContext.performAndWait {
            let batchInsertRequest = createBatchInsertMenuItemsRequest(from: menuItems)
            if let fetchResult = try? taskContext.execute(batchInsertRequest),
               let batchInsertResult = fetchResult as? NSBatchInsertResult,
               let success = batchInsertResult.result as? Bool, success {
                return
            }
            throw MenuDBError.batchInsertError
        }
    }
    
    static func addMenu(menu: MenuJSON) async throws {
        do {
            try await PersistenceController.shared.importMenuItems(from: menu.menuItems)
        } catch {
            print("error is \(error)")
        }
    }
    
    func fetchMenuItems(sortBy: NSSortDescriptor = NSSortDescriptor(key: "name", ascending: true)) -> [Item] {
        let context = container.viewContext
        let fetchRequest: NSFetchRequest<Item>
        fetchRequest = Item.fetchRequest()
        fetchRequest.sortDescriptors = [sortBy]
        //fetchRequest.sortDescriptors = [NSSortDescriptor(key: "name", ascending: false)]
        guard let results = try? context.fetch(fetchRequest),
              !results.isEmpty else { return [] }
        return results as [Item]
    }

}

