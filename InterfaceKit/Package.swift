// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "InterfaceKit",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "InterfaceKit",
            targets: ["InterfaceKit"]
        ),
    ],
    targets: [
        .target(
            name: "InterfaceKit",
            dependencies: [],
            resources: [
                .process("Resources"),
            ]
        ),
    ]
)
