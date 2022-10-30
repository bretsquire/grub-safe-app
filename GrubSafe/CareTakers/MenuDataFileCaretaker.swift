//
//  MenuDataCaretaker.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/16/22.
//

import Foundation

public class MenuDataFileCaretaker {
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    let dataFileURL = URL(fileURLWithPath: "MenuData",
                          relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
    
    public func save(_ menu: MenuJSON) async {
        Task {
            do {
                let data = try encoder.encode(menu)
                try data.write(to: dataFileURL, options: .atomicWrite)
            } catch let error {
                print(error)
            }
        }
    }
    
    public func load() throws -> MenuJSON {
        guard FileManager.default.fileExists(atPath: dataFileURL.path) else {
            throw(Error.dataFileNotFound)
        }
        do {
            let data = try Data(contentsOf: dataFileURL)
            return try decoder.decode(MenuJSON.self, from: data)
        } catch let error {
            throw(error)
        }
    }
    
    public enum Error: String, Swift.Error {
        case dataFileNotFound
    }
}
