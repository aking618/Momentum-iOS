import ProjectDescription

let project = Project(
    name: "Momentum",
    targets: [
        // Main app
        .target(
            name: "Momentum",
            destinations: .iOS,
            product: .app,
            bundleId: "com.ayrenking.Momentum",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .file(path: "Momentum/Info.plist"),
            sources: ["Momentum/Sources/**"],
            resources: ["Momentum/Resources/**"],
            entitlements: "Momentum/Momentum.entitlements",
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .external(name: "SharingGRDB"),
                .target(name: "MomentumUI"),
                .target(name: "Database"),
                .target(name: "Events"),
                .target(name: "Home"),
                .target(name: "Profile"),
            ]
        ),
        // Unit tests
        .target(
            name: "MomentumTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ayrenking.MomentumTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Momentum/Tests/MomentumTests/**"],
            resources: [],
            dependencies: [.target(name: "Momentum")]
        ),
        // UI test
        .target(
            name: "MomentumUserInterfaceTests",
            destinations: .iOS,
            product: .uiTests,
            bundleId: "com.ayrenking.MomentumUserInterfaceTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Momentum/Tests/MomentumUITests/**"],
            resources: [],
            dependencies: [.target(name: "Momentum")]
        ),

        // Database
        .target(
            name: "Database",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ayrenking.Database",
            deploymentTargets: .iOS("18.0"),
            sources: ["Database/Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .external(name: "SharingGRDB")
            ]
        ),
        .target(
            name: "DatabaseTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ayrenking.DatabaseTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Database/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Database")]
        ),

        // Events
        .target(
            name: "Events",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ayrenking.Events",
            deploymentTargets: .iOS("18.0"),
            sources: ["Events/Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .target(name: "MomentumUI"),
            ]
        ),
        .target(
            name: "EventsTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ayrenking.EventsTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Events/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Events")]
        ),

        // Home
        .target(
            name: "Home",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ayrenking.Home",
            deploymentTargets: .iOS("18.0"),
            sources: ["Home/Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .target(name: "MomentumUI"),
            ]
        ),
        .target(
            name: "HomeTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ayrenking.HomeTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Home/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Home")]
        ),

        // Profile
        .target(
            name: "Profile",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ayrenking.Profile",
            deploymentTargets: .iOS("18.0"),
            sources: ["Profile/Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture"),
                .target(name: "MomentumUI"),
            ]
        ),
        .target(
            name: "ProfileTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ayrenking.ProfileTests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["Profile/Tests/**"],
            resources: [],
            dependencies: [.target(name: "Profile")]
        ),

        // MomentumUI
        .target(
            name: "MomentumUI",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.ayrenking.MomentumUI",
            deploymentTargets: .iOS("18.0"),
            sources: ["MomentumUI/Sources/**"],
            dependencies: [
                .external(name: "ComposableArchitecture")
            ]
        ),
        .target(
            name: "MomentumUITests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.ayrenking.MomentumUITests",
            deploymentTargets: .iOS("18.0"),
            infoPlist: .default,
            sources: ["MomentumUI/Tests/**"],
            resources: [],
            dependencies: [.target(name: "MomentumUI")]
        ),
    ]
)
