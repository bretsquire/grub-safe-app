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
    func download() async throws -> Data {
        // MARK: Assignment #2 - Download & Print
        let (downloadURL, response) = try await session.download(from: menuUrl)
        
        // MARK: Assignment #3 - Handle Errors Gracefully
        if let httpResponse = response as? HTTPURLResponse,
           !(200..<300).contains(httpResponse.statusCode) {
            throw MenuApiError.serverError(statusCode: httpResponse.statusCode)
        }
        
        return try! Data(contentsOf: downloadURL)
    }
}
