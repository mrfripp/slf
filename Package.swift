// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "slf",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "slf",
            targets: ["slf"]
        ),
        .library(
            name: "SimpleLogger",
            targets: ["SimpleLogger"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Nimble", .exact("9.0.0"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "slf",
            dependencies: []
        ),
        .testTarget(
            name: "slfTests",
            dependencies: ["slf", "Nimble"]
        ),
        .target(
            name: "SimpleLogger",
            dependencies: ["slf"]
        ),
        .testTarget(
            name: "SimpleLoggerTests",
            dependencies: ["SimpleLogger", "Nimble"]
        )
    ]
)
