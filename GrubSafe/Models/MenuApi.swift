//
//  MenuApi.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/10/22.
//

import Foundation

class MenuApi {
    
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
    func download() async -> Data {
        // MARK: Assignment #2 - Download & Print
        let (downloadURL, _) = try! await session.download(from: menuUrl)
        return try! Data(contentsOf: downloadURL)
    }
}
