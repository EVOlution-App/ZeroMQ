// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ZeroMQ",
    products: [
        .library(
            name: "ZeroMQKit",
            targets: ["ZeroMQKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/evolution-app/CZeroMQ.git", from: "1.0.4")
    ],
    targets: [
        .target(name: "ZeroMQKit"),
        .testTarget(
            name: "MainTests",
            dependencies: ["ZeroMQKit"]
        )
    ]
)
