// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "FileStreamer",
    products: [
        .library(
            name: "FileStreamer",
            targets: ["FileStreamer"])
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/ResourceHelper.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "FileStreamer",
            dependencies: []),
        .testTarget(
            name: "FileStreamerTests",
            dependencies: ["FileStreamer", "ResourceHelper"])
    ]
)
