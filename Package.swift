// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FastlyEdgeExample",
    dependencies: [
        .package(name: "Compute", url: "https://github.com/AndrewBarba/swift-compute-runtime", branch: "main")
    ],
    targets: [
        .executableTarget(name: "FastlyEdgeExample", dependencies: ["Compute"]),
    ]
)
