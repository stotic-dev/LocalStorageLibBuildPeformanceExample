// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalStoragePeformanceExample",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(
            name: "SampleUI",
            targets: ["SampleUI"]
        ),
        .library(
            name: "RealmClient",
            targets: ["RealmClient"]
        ),
        .library(
            name: "SwiftDataClient",
            targets: ["SwiftDataClient"]
        )
    ],
    targets: [
        .target(
            name: "SampleUI"
        ),
        .target(
            name: "RealmClient",
            dependencies: [
                "SampleUI",
                "RealmModel"
            ]
        ),
        .target(
            name: "SwiftDataClient",
            dependencies: [
                "SampleUI",
                "SwiftDataModel"
            ]
        ),
        .target(
            name: "RealmModel",
            dependencies: [
                "RealmSwiftBinary",
                "RealmBinary"
            ]
        ),
        .binaryTarget(
            name: "RealmSwiftBinary",
            path: "RealmSwift.xcframework"
        ),
        .binaryTarget(
            name: "RealmBinary",
            path: "Realm.xcframework"
        ),
        .target(name: "SwiftDataModel")
    ]
)
