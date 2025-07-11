// swift-tools-version: 6.0
import PackageDescription

#if TUIST
    import struct ProjectDescription.PackageSettings

    let packageSettings = PackageSettings(
        productTypes: [
            "ComposableArchitecture": .framework,
//            "SwiftNavigation": .framework,
            "XCTestDynamicOverlay": .framework,
//            "CasePaths": .framework,
            "CombineSchedulers": .framework,
            "ConcurrencyExtras": .framework,
            "CustomDump": .framework,
            "Dependencies": .framework,
//            "DependenciesMacros": .framework,
            "IdentifiedCollections": .framework,
            "IssueReporting": .framework,
            "OrderedCollections": .framework,
//            "_CollectionsUtilities": .framework,
//            "Perception": .framework,
            "PerceptionCore": .framework,
            "Sharing": .framework,
//            "Sharing1": .framework,
//            "Sharing2": .framework,
//            "SwiftUINavigation": .framework,
//            "SwiftUINavigationCore": .framework,
//            "UIKitNavigation": .framework,
//            "DequeModule": .framework,
            "SharingGRDB": .framework,
        ],
        targetSettings: [
            "ComposableArchitecture": .settings(base: [
                "OTHER_SWIFT_FLAGS": ["-module-alias", "Sharing=SwiftSharing"]
            ]),
            "Sharing": .settings(base: [
                "PRODUCT_NAME": "SwiftSharing",
                "OTHER_SWIFT_FLAGS": ["-module-alias", "Sharing=SwiftSharing"]
            ]),
            "SharingGRDBCore": .settings(base: [
                "OTHER_SWIFT_FLAGS": ["-module-alias", "Sharing=SwiftSharing"]
            ])
        ]
    )
#endif

let package = Package(
    name: "Momentum",
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "1.20.2"),
          .package(url: "https://github.com/pointfreeco/sharing-grdb", from: "0.5.0")
    ]
)
