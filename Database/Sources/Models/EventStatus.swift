//
//  EventStatus.swift
//  Database
//
//  Created by Ayren King on 7/10/25.
//

import SharingGRDB

public enum EventStatus: Int, Equatable, Hashable, Identifiable, QueryBindable {
    public var id: Self { self }

    case upcoming
    case finished
    case didNotFinish
}
