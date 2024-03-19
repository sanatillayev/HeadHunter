// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Applied",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Applied",
            targets: ["Applied"]),
    ],
    dependencies: [
        .package(path: "Router"),
        .package(path: "UIComponents"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Applied",
            dependencies: [
                "Router",
                "UIComponents"
            ]),
        .testTarget(
            name: "AppliedTests",
            dependencies: ["Applied"]),
    ]
)
