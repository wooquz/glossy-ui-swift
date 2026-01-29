// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "GlossyUI",
    platforms: [
        .iOS(.v15),
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "GlossyUI",
            targets: ["GlossyUI"]
        )
    ],
    targets: [
        .target(
            name: "GlossyUI",
            path: "Sources"
        )
    ]
)
