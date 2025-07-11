//
//  Schema.swift
//  Database
//
//  Created by Ayren King on 7/11/25.
//

import OSLog
import SharingGRDB

public extension DatabaseWriter where Self == DatabaseQueue {
    static func appDatabase() throws -> any DatabaseWriter {
        @Dependency(\.context) var context
        var configuration = Configuration()
        configuration.foreignKeysEnabled = true
        #if DEBUG
        configuration.prepareDatabase { db in
            db.trace(options: .profile) {
                if context == .preview {
                    print($0.expandedDescription)
                } else {
                    logger.debug("\($0.expandedDescription)")
                }
            }
        }
        #endif

        let database: DatabaseWriter
        if context == .live {
            let path = URL.documentsDirectory.appending(component: "db.sqlite").path()
            logger.info("open \(path)")
            database = try DatabasePool(path: path, configuration: configuration)
        } else if context == .test {
            let path = URL.temporaryDirectory.appending(component: "\(UUID().uuidString)-db.sqlite").path()
            database = try DatabasePool(path: path, configuration: configuration)
        } else {
            database = try DatabaseQueue(configuration: configuration)
        }

        var migrator = DatabaseMigrator()
        #if DEBUG
        migrator.eraseDatabaseOnSchemaChange = true
        #endif

        migrator.registerMigration("Create initial tables") { db in
            try #sql(
                """
                CREATE TABLE \(quote: EventType.tableName) (
                    "id" TEXT PRIMARY KEY NOT NULL ON CONFLICT REPLACE DEFAULT (uuid()),
                    "name" TEXT NOT NULL,
                    "isDeletable" BOOL NOT NULL DEFAULT 1
                )
                """
            )
            .execute(db)

            try db.seed {
                EventType.Draft(name: "5K", isDeletable: false)
                EventType.Draft(name: "10K", isDeletable: false)
                EventType.Draft(name: "Half Marathon", isDeletable: false)
                EventType.Draft(name: "Marathon", isDeletable: false)
                EventType.Draft(name: "Sprint Triathlon", isDeletable: false)
                EventType.Draft(name: "Olympic Triathlon", isDeletable: false)
                EventType.Draft(name: "Half Ironman (70.3)", isDeletable: false)
                EventType.Draft(name: "Full Ironman (140.6)", isDeletable: false)
            }
        }


        try migrator.migrate(database)

        // Migration for test data
        #if DEBUG
        try database.write { db in
            try db.insertSampleData()
        }
        #endif

        return database
    }

    private static var logger: Logger { Logger(subsystem: "Momentum", category: "Database") }
}

#if DEBUG
extension Database {
    func insertSampleData() throws {

    }
}
#endif
