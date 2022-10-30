//
//  GrubSafeUITests.swift
//  GrubSafeUITests
//
//  Created by Bret Squire on 10/28/22.
//

import XCTest

final class GrubSafeUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func test_SortBy() throws {
        if app.navigationBars["Menu"].waitForExistence(timeout: 10) {
            XCTAssert(app.navigationBars["Menu"].exists)
            let menuNavBar = app.navigationBars["Menu"]
            XCTAssert(menuNavBar.buttons["Filter"].exists)
            let filterButton = menuNavBar.buttons["Filter"]
            filterButton.tap()
        }
    }
    
    func test_Welcome() throws {
        if app.navigationBars["Menu"].waitForExistence(timeout: 10) {
            XCTAssert(app.tabBars["Tab Bar"].buttons["Welcome"].exists)
            app.tabBars["Tab Bar"].buttons["Welcome"].tap()
            XCTAssert(app.buttons["person.crop.circle.badge.questionmark.fill"].exists)
            app.buttons["person.crop.circle.badge.questionmark.fill"].tap()
            XCTAssert(app.buttons["Press to dismiss"].exists)
            app.buttons["Press to dismiss"].tap()
        }
    }
    
    func test_Favorites() throws {
        if app.navigationBars["Menu"].waitForExistence(timeout: 10) {
            XCTAssert(app.tabBars["Tab Bar"].buttons["Favorites"].exists)
            app.tabBars["Tab Bar"].buttons["Welcome"].tap()
        }
    }
    
    func test_Order() throws {
        if app.navigationBars["Menu"].waitForExistence(timeout: 10) {
            XCTAssert(app.tabBars["Tab Bar"].buttons["Order"].exists)
            app.tabBars["Tab Bar"].buttons["Order"].tap()
        }
    }
    
}
