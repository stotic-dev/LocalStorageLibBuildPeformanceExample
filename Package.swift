// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LocalStoragePeformanceExample",
    platforms: [.iOS(.v18), .macOS(.v15)],
    products: [
        .library(
            name: "LocalStoragePeformanceExample",
            targets: ["LocalStoragePeformanceExample"]
        ),
        .library(
            name: "RealmClient",
            targets: ["RealmClient"]
        ),
        .library(
            name: "SwiftDataClient",
            targets: ["SwiftDataClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/realm-swift.git", exact: "20.0.2")
    ],
    targets: [
        .target(
            name: "LocalStoragePeformanceExample"
        ),
        .target(
            name: "RealmClient",
            dependencies: [
                "LocalStoragePeformanceExample",
                "RealmModel"
            ]
        ),
        .target(
            name: "SwiftDataClient",
            dependencies: [
                "LocalStoragePeformanceExample",
                "SwiftDataModel"
            ]
        ),
        .target(
            name: "RealmModel",
            dependencies: [
                .product(name: "RealmSwift", package: "realm-swift")
            ]
        ),
        .target(name: "SwiftDataModel")
    ]
)
