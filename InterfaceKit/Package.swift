// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "InterfaceKit",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "InterfaceKit",
            targets: ["InterfaceKit"]),
    ],
    targets: [
        .target(
            name: "InterfaceKit",
            dependencies: [],
            resources: [
                .process("Resources")
            ]),
    ]
)
