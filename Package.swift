// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlexibleText",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FlexibleText",
            targets: ["FlexibleText"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "FlexibleText",
            dependencies: []),
        .testTarget(
            name: "FlexibleTextTests",
            dependencies: ["FlexibleText"]),
    ]
)
