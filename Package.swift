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
    dependencies: [],
    targets: [
        .target(
            name: "Bip39",
            dependencies: []),
        .testTarget(
            name: "Bip39Tests",
            dependencies: ["Bip39"]),
    ]
)

#if !canImport(CommonCrypto)
package.targets.append(
    .target(
        name: "CBip39Crypto",
        dependencies: [],
        cSettings: [
            .define("SHA2_UNROLL_TRANSFORM")
        ]
    )
)
package.targets.first(where: { $0.name == "Bip39" })!.dependencies.append("CBip39Crypto")
#endif
