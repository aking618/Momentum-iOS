//
//  SwiftDataModelConfigurationProvider.swift
//  Database
//
//  Created by Ayren King on 12/30/24.
//

import SwiftData

public class SwiftDataModelConfigurationProvider {
    nonisolated(unsafe) public static let shared = SwiftDataModelConfigurationProvider(isStoredInMemoryOnly: false, autoSaveEnabled: true)

    private var isStoredInMemoryOnly: Bool
    private var autoSaveEnabled: Bool

    private init(isStoredInMemoryOnly: Bool, autoSaveEnabled: Bool) {
        self.isStoredInMemoryOnly = isStoredInMemoryOnly
        self.autoSaveEnabled = autoSaveEnabled
    }

    @MainActor
    public lazy var container: ModelContainer = {
        let schema = Schema(
            [
                // Event.self
            ]
        )

        let configuration = ModelConfiguration(isStoredInMemoryOnly: isStoredInMemoryOnly)

        do {
            let container = try ModelContainer(for: schema, configurations: [configuration])
            container.mainContext.autosaveEnabled = autoSaveEnabled
            return container
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }()
}
