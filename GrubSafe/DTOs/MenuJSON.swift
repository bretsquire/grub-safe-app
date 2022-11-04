//
//  Menu.swift
//  GrubSafe
//
//  Created by Bret Squire on 8/29/22.
//
import Combine

public class MenuJSON: Codable, ObservableObject {
    // MARK: - Properties
    var menuItems: [MenuItem] = []
    
    enum CodingKeys: String, CodingKey {
        case menuItems = "Result"
    }
}
