// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "nuvei-cashier-helper-ios",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "NuveiCashierHelper",
            targets: ["NuveiCashierHelperWrapper"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "NuveiCashierHelperWrapper",
            dependencies: [
                .target(name: "NuveiCashierHelper")
            ],
            path: "SwiftPM/NuveiCashierHelperWrapper"
        ),

        .binaryTarget(
            name: "NuveiCashierHelper",
            path: "NuveiCashierHelper.xcframework"
        )
    ]
)
