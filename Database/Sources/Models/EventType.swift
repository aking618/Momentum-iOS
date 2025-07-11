//
//  EventType.swift
//  Database
//
//  Created by Ayren King on 7/10/25.
//

import Foundation

public struct EventType: Codable, Identifiable, Hashable {
    public var id: UUID
    public var name: String
    public var displayName: String
    public var isDeletable: Bool

    public init(
        id: UUID = UUID(),
        name: String,
        displayName: String,
        isDeletable: Bool = true
    ) {
        self.id = id
        self.name = name
        self.displayName = displayName
        self.isDeletable = isDeletable
    }
}
