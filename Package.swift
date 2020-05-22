// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "ZeroMQ",
    products: [
        .library(
            name: "ZeroMQKit",
            targets: [
                "ZeroMQKit"
            ]
        )
    ],
    targets: [
        .target(
            name: "ZeroMQKit",
            dependencies: ["CZeroMQ"]
        ),
        .systemLibrary(
            name: "CZeroMQ",
            path: "Sources/CZeroMQ",
            pkgConfig: "libzmq",
            providers: [
                .brew([
                    "zmq"
                ]),
                .apt([
                    "libzmq3-dev"
                ])
            ]
        ),
        .testTarget(
            name: "MainTests",
            dependencies: ["ZeroMQKit"]
        )
    ]
)
