//
//  MenuApi.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/10/22.
//

import Foundation

class MenuApi {
    
    // MARK: Song Download Error
    enum MenuApiError: Error {
        case serverError(statusCode: Int)
        case unknownError
    }
    
    // MARK: Properties
    private let menuUrl = URL(string: Constants.Api.endpoint + Constants.Api.menuPath)!
    private let session: URLSession
    private let sessionConfiguration: URLSessionConfiguration
    
    // MARK: Initialization
    init() {
        self.sessionConfiguration = URLSessionConfiguration.default
        self.session = URLSession(configuration: sessionConfiguration)
    }
    
    // MARK: Functions
    func getMenuItems() async throws -> MenuJSON {
        // TODO: create my own local server endpoint
        let (data, response) = try await session.data(from: menuUrl)

        if let httpResponse = response as? HTTPURLResponse,
           !(200..<300).contains(httpResponse.statusCode) {
            throw MenuApiError.serverError(statusCode: httpResponse.statusCode)
        }

        let jsonMenu = try JSONDecoder().decode(MenuJSON.self, from: data)
        return jsonMenu
    }
    
    func getMenuItemsForPreview() async throws -> MenuJSON {
        let jsonFileUrl = Bundle.main.url(forResource: "menu", withExtension: "json")!
        let decoder = JSONDecoder()
        let data = try! Data(contentsOf: jsonFileUrl)
        return try! decoder.decode(MenuJSON.self, from: data)
    }
}
