//
//  EventType.swift
//  Database
//
//  Created by Ayren King on 7/10/25.
//

import Foundation
import SharingGRDB

@Table
public struct EventType: Codable, Identifiable, Hashable {
    public var id: UUID
    public var name: String
    public var isDeletable: Bool
}
