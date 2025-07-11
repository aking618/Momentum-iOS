//
//  Event.swift
//  Database
//
//  Created by Ayren King on 7/10/25.
//

import Foundation
import SharingGRDB

@Table
public struct Event: Identifiable, Equatable {
    public var id: Int
    public var name: String
    public var eventTypeID: EventType.ID
    public var date: Date
    public var location: Location.ID?
    public var status: EventStatus
    public var finishTime: TimeInterval?
    public var scheduledReminder: Date?
    public var notes: String?
}

@Table
public struct Location: Identifiable, Equatable {
    public var id: Int
    public let name: String
    public let latitude: Double?
    public let longitude: Double?
}
