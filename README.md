# Bip39.swift

![🐧 linux: ready](https://img.shields.io/badge/%F0%9F%90%A7%20linux-ready-red.svg)
[![GitHub license](https://img.shields.io/badge/license-Apache%202.0-lightgrey.svg)](LICENSE)
[![Build Status](https://github.com/tesseract-one/Bip39.swift/workflows/Build%20&%20Tests/badge.svg?branch=main)](https://github.com/tesseract-one/Bip39.swift/actions/workflows/build.yml?query=branch%3Amain)
[![GitHub release](https://img.shields.io/github/release/tesseract-one/Bip39.swift.svg)](https://github.com/tesseract-one/Bip39.swift/releases)
[![SPM compatible](https://img.shields.io/badge/SwiftPM-Compatible-brightgreen.svg)](https://swift.org/package-manager/)
[![CocoaPods version](https://img.shields.io/cocoapods/v/Bip39.swift.svg)](https://cocoapods.org/pods/Bip39.swift)
![Platform macOS | iOS | tvOS | watchOS | Linux](https://img.shields.io/badge/platform-Linux%20%7C%20macOS%20%7C%20iOS%20%7C%20tvOS%20%7C%20watchOS-orange.svg)

Cross-platform BIP39 mnemonic implementation for Swift.

## Installation

Bip39.swift deploys to macOS, iOS, tvOS, watchOS and Linux. It has been tested on the latest OS releases only however, as the module uses very few platform-provided APIs, there should be very few issues with earlier versions.

Setup instructions:

- **Swift Package Manager:**
  Add this to the dependency section of your `Package.swift` manifest:

    ```Swift
    .package(url: "https://github.com/tesseract-one/Bip39.swift.git", from: "0.1.0")
    ```

- **CocoaPods:** Put this in your `Podfile`:

    ```Ruby
    pod 'Bip39.swift', '~> 0.1'
    ```

## Usage Examples

### Random generated mnemonic
```Swift
import Bip39

// 128bit mnemonic by default
let mnemonic = try! Mnemonic()

// Obtaining phrase. English by default. Returns string array
let phrase = mnemonic.mnemonic().joined(separator: " ")

print("Mnemonic: ", phrase)
```

### Mnemonic from Bip39 string
```Swift
import Bip39

// Mnemonic phrase
let phrase = "rally speed budget undo purpose orchard hero news crunch flush wine finger"

// Creating mnemonic. English wordlist by default
let mnemonic = try! Mnemonic(mnemonic: phrase.components(separatedBy: " "))

// 128 bit entropy
print("Entropy: ", mnemonic.entropy)
```

### Seed from Mnemonic
```Swift
import Bip39

// Mnemonic phrase
let phrase = "rally speed budget undo purpose orchard hero news crunch flush wine finger"

// Creating mnemonic. English wordlist by default
let mnemonic = try! Mnemonic(mnemonic: phrase.components(separatedBy: " "))

// Empty password and English wordlist by default
let seed = mnemonic.seed()

print("Seed: ", seed)
```

### Check Bip39 string is valid
```Swift
import Bip39

// Mnemonic phrase
let phrase = "rally speed budget undo purpose orchard hero news crunch flush wine finger"

// Validation. English wordlist by default
let isValid = Mnemonic.isValid(phrase: phrase.components(separatedBy: " "))

print("Valid: ", isValid)
```

## License

Bip39.swift can be used, distributed and modified under [the Apache 2.0 license](LICENSE).
