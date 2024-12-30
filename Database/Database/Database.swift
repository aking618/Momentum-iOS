//
//  Database.swift
//  Database
//
//  Created by Ayren King on 12/30/24.
//

import Dependencies
import SwiftData

public struct Database: Sendable {
    var context: ModelContext
}

extension Database: DependencyKey {
    public static let liveValue: Database = Self(
        context: liveContext()
    )
}

@MainActor
internal let liveContext: (() -> ModelContext) = {
    SwiftDataModelConfigurationProvider.shared.container.mainContext
}

public extension DependencyValues {
    var databaseService: Database {
        get { self[Database.self] }
        set { self[Database.self] = newValue }
    }
}

#if hasFeature(RetroactiveAttribute)
extension KeyPath: @unchecked @retroactive Sendable {}
extension ModelContext: @unchecked @retroactive Sendable {}
#else
extension KeyPath: @unchecked Sendable {}
extension ModelContext: @unchecked Sendable {}
#endif
