// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var package = Package(
    name: "Bip39",
    products: [
        .library(
            name: "Bip39",
            targets: ["Bip39"]),
    ],
    dependencies: [
        .package(url: "https://github.com/tesseract-one/UncommonCrypto.swift.git", from: "0.1.0")
    ],
    targets: [
        .target(
            name: "Bip39",
            dependencies: ["UncommonCrypto"]),
        .testTarget(
            name: "Bip39Tests",
            dependencies: ["Bip39"]),
    ]
)
