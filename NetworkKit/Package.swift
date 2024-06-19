// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/scinfu/SwiftSoup",
            .upToNextMinor(from: "2.7.2")),
    ],
    targets: [
        .target(
            name: "NetworkKit",
            dependencies: ["SwiftSoup"]),
    ])
