// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Login",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Login",
            targets: ["Login"]),
    ],
    dependencies: [
        .package(path: "Router"),
        .package(path: "UIComponents"),
        .package(path: "Search"),
        .package(path: "Auth")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Login",
            dependencies: [
                "Router",
                "UIComponents",
                "Search",
                "Auth"
            ]),
        .testTarget(
            name: "LoginTests",
            dependencies: ["Login"]),
    ]
)
