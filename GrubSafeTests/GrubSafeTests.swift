//
//  GrubSafeTests.swift
//  GrubSafeTests
//
//  Created by Bret Squire on 10/27/22.
//

import XCTest
import CoreData
@testable import GrubSafe

final class GrubSafeTests: XCTestCase {

    func test_MenuViewModel_init() throws {
        let menuViewModel = MenuViewModel()
        XCTAssertEqual(menuViewModel.items.count, 0, "number of menu items must be 0 initially")
    }

    func test_Favorites() throws {
        let dummyFavorites = Favorites.initDummy()
        let dummyItem = StubItem(id: "1")
        XCTAssertTrue(dummyFavorites.isFavorite(dummyItem))

        var favorites = Favorites()
        let firstItem = StubItem(id: "12345")
        let secondItem = StubItem(id: "differentId")
        let allItems = [firstItem, secondItem]

        var favoriteItems = favorites.items(allItems)
        XCTAssertFalse(favorites.isFavorite(firstItem))
        XCTAssertFalse(favorites.isFavorite(secondItem))
        XCTAssertEqual(favoriteItems.count, 0, "number of favorite items must be 0 initially")

        favorites.toggle(firstItem)
        favoriteItems = favorites.items(allItems)
        XCTAssertTrue(favorites.isFavorite(firstItem))
        XCTAssertFalse(favorites.isFavorite(secondItem))
        XCTAssertEqual(favoriteItems.count, 1, "number of favorite items must be 1")

        favorites.toggle(secondItem)
        favoriteItems = favorites.items(allItems)
        XCTAssertTrue(favorites.isFavorite(firstItem))
        XCTAssertTrue(favorites.isFavorite(secondItem))
        XCTAssertEqual(favoriteItems.count, 2, "number of favorite items must be 2")

        favorites.toggle(firstItem)
        favoriteItems = favorites.items(allItems)
        XCTAssertFalse(favorites.isFavorite(firstItem))
        XCTAssertTrue(favorites.isFavorite(secondItem))
        XCTAssertEqual(favoriteItems.count, 1, "number of favorite items must be 1 again")

        favorites.toggle(secondItem)
        favoriteItems = favorites.items(allItems)
        XCTAssertFalse(favorites.isFavorite(firstItem))
        XCTAssertFalse(favorites.isFavorite(secondItem))
        XCTAssertEqual(favoriteItems.count, 0, "number of favorite items must be 0 again")
    }

    func test_MenuJSON() {
        let decoder = JSONDecoder()
        let testBundle = Bundle(for: GrubSafeTests.self)
        do {
            let jsonFileUrl = try XCTUnwrap(testBundle.url(forResource: "menu", withExtension: "json"))
            let data = try Data(contentsOf: jsonFileUrl)
            _ = try decoder.decode(MenuJSON.self, from: data)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func test_MenuItem() {
        let expectedDictionary: [String: Any] = [
            "id": "someId",
            "name": "someName",
            "descriptions": "someDescription",
            "images": ["someUrl"]
        ]
        let menuItem = MenuItem(id: expectedDictionary["id"] as! String,
                                name: expectedDictionary["name"] as! String,
                                descriptions: (expectedDictionary["descriptions"] as! String),
                                images: expectedDictionary["images"] as! [String]
        )
        XCTAssertEqual(menuItem.dictionaryValue["id"] as! String, expectedDictionary["id"] as! String, "the dictionary properties is correct")
        XCTAssertEqual(menuItem.dictionaryValue["name"] as! String, expectedDictionary["name"] as! String, "the dictionary properties is correct")
        XCTAssertEqual(menuItem.dictionaryValue["descriptions"] as! String, expectedDictionary["descriptions"] as! String, "the dictionary properties is correct")
        XCTAssertEqual(menuItem.dictionaryValue["images"] as! [String], expectedDictionary["images"] as! [String], "the dictionary properties is correct")
    }
    
    func test_Item() {
        let expect = String(format: "$%.02f", 1.99)
        let item = StubItem(id: "12345")
        XCTAssertEqual(item.costAsString, expect, "the cost of item is not correct")
        let expectedFetchRequest = NSFetchRequest<Item>(entityName: "Item")
        XCTAssertEqual(Item.fetchRequest(), expectedFetchRequest, "can return NSFetchRequest")
    }
    
    func test_Discount() {
        var discount: Discount = .default
        XCTAssertTrue(discount.description.contains("5%"))
        discount = .thanksgiving
        XCTAssertTrue(discount.description.contains("10%"))
        discount = .christmas
        XCTAssertTrue(discount.description.contains("15%"))
        discount = .newYear
        XCTAssertTrue(discount.description.contains("20%"))
        XCTAssertEqual(discount.applyDiscount(1.00), 0.8, "discount not applied correctly")
    }
    
//    func test_noServerResponse() async throws{
//        //var expectation = expectation(description: "Server responds in reasonable time")
//        let menuApi = MenuApi()
//        do {
//            let newMenu = try await menuApi.getMenuItems()
//            //expectation.fulfill()
//            //waitForExpectations(timeout: 3)
//            XCTAssertTrue(newMenu.menuItems.count > 0, "Menu API should returns many menu items")
//        } catch {
//            print(error)
//        }
//    }

}

class StubItem: Item {
    convenience init(id: String = "") {
        self.init()
        self.stubbedId = id
    }
    var stubbedId: String = ""
    override var id: String {
        set {}
        get {
            return stubbedId
        }
    }
}
