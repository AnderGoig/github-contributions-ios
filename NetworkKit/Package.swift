// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "NetworkKit",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "NetworkKit",
            targets: ["NetworkKit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/scinfu/SwiftSoup",
            .upToNextMinor(from: "2.13.4")
        ),
    ],
    targets: [
        .target(
            name: "NetworkKit",
            dependencies: ["SwiftSoup"]
        ),
    ]
)
