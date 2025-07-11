//
//  Event.swift
//  Database
//
//  Created by Ayren King on 7/10/25.
//

import Foundation

public struct Event: Codable, Identifiable, Equatable {
    public var id: UUID
    public var name: String
    public var typeId: UUID
    public var date: Date
    public var location: String? // simple for now; can evolve to store lat/lng
    public var status: EventStatus
    public var scheduledReminder: Date?
    public var notes: String?

    public init(
        id: UUID = UUID(),
        name: String,
        typeId: UUID,
        date: Date,
        location: String? = nil,
        status: EventStatus = .upcoming,
        scheduledReminder: Date? = nil,
        notes: String? = nil
    ) {
        self.id = id
        self.name = name
        self.typeId = typeId
        self.date = date
        self.location = location
        self.status = status
        self.scheduledReminder = scheduledReminder
        self.notes = notes
    }
}

public struct Location: Codable {
    public let name: String
    public let latitude: Double?
    public let longitude: Double?
}
