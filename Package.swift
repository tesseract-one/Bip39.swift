// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

var package = Package(
    name: "Bip39",
    platforms: [.macOS(.v10_13), .iOS(.v11), .tvOS(.v11), .watchOS(.v6)],
    products: [
        .library(
            name: "Bip39",
            targets: ["Bip39"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tesseract-one/UncommonCrypto.swift.git",
                 .upToNextMinor(from: "0.2.0"))
    ],
    targets: [
        .target(
            name: "Bip39",
            dependencies: [
                .product(name: "UncommonCrypto", package: "UncommonCrypto.swift")
            ]),
        .testTarget(
            name: "Bip39Tests",
            dependencies: ["Bip39"]),
    ]
)
