// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/scinfu/SwiftSoup.git",
            .upToNextMinor(from: "2.3.0"))
    ],
    targets: [
        .target(
            name: "NetworkKit",
            dependencies: ["SwiftSoup"]),
        .testTarget(
            name: "NetworkKitTests",
            dependencies: ["NetworkKit"]),
    ]
)
