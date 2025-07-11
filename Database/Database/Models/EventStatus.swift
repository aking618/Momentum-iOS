//
//  EventStatus.swift
//  Database
//
//  Created by Ayren King on 7/10/25.
//

public enum EventStatus: Equatable, Codable {
    case upcoming
    case finished(Duration)
    case didNotFinish
}
