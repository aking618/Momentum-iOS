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

        // register migrations

        try migrator.migrate(database)

        // Migration for test data
        #if DEBUG
        migrator.insertSampleData()
        #endif

        return database
    }

    private static var logger: Logger { Logger(subsystem: "Momentum", category: "Database") }
}

#if DEBUG
extension DatabaseMigrator {
    mutating func insertSampleData() {
//        self.registerMigration("Add Upcoming Event") { db in
//            _ = try Event(
//                name: "OKC River Run",
//                typeId: UUID(),
//                date: .now.addingTimeInterval(86400 * 3)
//            ).inserted(db)
//        }
    }
}
#endif
