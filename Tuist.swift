import ProjectDescription

let tuist = Tuist(
    project: .tuist(
        swiftVersion: Version(string: "6.0"),
//        plugins: [.local(path: .relativeToRoot("Plugins"))]
    )
)
