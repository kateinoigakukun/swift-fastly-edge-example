// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FastlyEdgeExample",
    products: [
    ],
    dependencies: [],
    targets: [
        .executableTarget(name: "FastlyEdgeExample", dependencies: ["_CFastlyEdge"]),
        .target(name: "_CFastlyEdge"),
    ]
)
