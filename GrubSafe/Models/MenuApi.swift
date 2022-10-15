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
    func fetchMenu() async throws -> Menu {
        // MARK: Assignment #2 - Download & Print
        let (data, response) = try await session.data(from: menuUrl)
        
        // MARK: Assignment #3 - Handle Errors Gracefully
        if let httpResponse = response as? HTTPURLResponse,
           !(200..<300).contains(httpResponse.statusCode) {
            throw MenuApiError.serverError(statusCode: httpResponse.statusCode)
        }
        
        let jsonMenu = try JSONDecoder().decode(Menu.self, from: data)
        return jsonMenu
    }
    
    // MARK: Assignment #5 - Download & Print
    func getCookie() async throws {
        let rwUrl = URL(string: "https://www.raywenderlich.com")!
        let (_, response) = try await session.download(from: rwUrl)
        
        guard let httpResponse = response as? HTTPURLResponse,
              let fields = httpResponse.allHeaderFields as? [String: String],
              let cookie = HTTPCookie.cookies(withResponseHeaderFields: fields, for: rwUrl).first
        else {
            print("no cookies?")
            return
        }
        
        print("Cookie Name: \(cookie.name)")
        print("Cookie Value: \(cookie.value)")
    }
}
