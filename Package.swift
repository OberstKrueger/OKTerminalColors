// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "SwiftyTerminalColors",
    products: [
        .library(
            name: "SwiftyTerminalColors",
            targets: ["SwiftyTerminalColors"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SwiftyTerminalColors",
            dependencies: []
        )
    ]
)
