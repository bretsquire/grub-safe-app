//
//  MenuPlistCareTaker.swift
//  GrubSafe
//
//  Created by Bret Squire on 10/17/22.
//

import Foundation

public class MenuPlistCaretaker {
    private let decoder = PropertyListDecoder()
    private let encoder = PropertyListEncoder()
    let plistURL = URL(fileURLWithPath: "MenuData",
                       relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("plist")
    
    public func save(_ menu: Menu) async {
        Task {
            do {
                encoder.outputFormat = .xml
                let data = try encoder.encode(menu)
                try data.write(to: plistURL, options: .atomicWrite)
            } catch let error {
                print(error)
            }
        }
    }
    
    public func load() throws -> Menu {
        guard FileManager.default.fileExists(atPath: plistURL.path) else {
            throw(Error.plistNotFound)
        }
        do {
            let data = try Data(contentsOf: plistURL)
            return try decoder.decode(Menu.self, from: data)
        } catch let error {
            throw(error)
        }
    }
    
    public enum Error: String, Swift.Error {
        case plistNotFound
    }
}

