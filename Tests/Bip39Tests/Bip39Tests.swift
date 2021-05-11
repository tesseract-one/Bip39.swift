//
//  Bip39Tests.swift
//
//
//  Created by Yehor Popovych on 10.05.2021.
//

import XCTest
@testable import Bip39

final class Bip39Tests: XCTestCase {
    let testCases = [
        (phrase: "sting afraid shoe",
         entropy: "d5e09319".hex!,
         seed: "181f208b451530710ce4b107de5e97d281a725334079bf1219d55178d27cbc641cf7a47d848063a65b05b72b35046369a897544246ab9381f011624c165858f8".hex!,
         password: "testtest"),
        (phrase: "fantasy fever angle fish soon brisk",
         entropy: "530aac232bdcf438".hex!,
         seed: "52627382dce8cf2f14c375a0499522a677d30e9fbf39767424c7ad92f3af7e8f026f4a06726948c57a4164e3f1bba59dfeda5efde1c84460acd0d15ff16b407b".hex!,
         password: "testtesttest"),
        (phrase: "birth sword flower jar clerk already cake token hedgehog",
         entropy: "16bb89663ba2a60e48171f6a".hex!,
         seed: "6152a73f180217f27f6d67b7338acf5962c6b48ad61317235d878459fdb68722f706add0088245259deca79c62695184568471db8ffcca34ef3aaf1f4b1be84c".hex!,
         password: "testpass"),
        (phrase: "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about",
         entropy: Data(repeating: 0, count: 16),
         seed: "eb993cd3acdb5f3157974d761c5e5d40dc97155b7355af3de6ee7fb37d8b92b19b4b795691edde11775a1831c80ad21e48cb27e777881720db0278e93b409f4d".hex!,
         password: "test1password1"),
        (phrase: "rally speed budget undo purpose orchard hero news crunch flush wine finger",
         entropy: "b15a2076767ae7381ad4a934eb3bee2b".hex!,
         seed: "20A4F771F4146E41E0144D2F713D747FDCF8F2B53C441061DE9667FDE03B2157100536FC2F4D11F3D7B40721FF438AF7AAC34CF709E0DC307838767782A7C040".hex!,
         password: "123"),
        (phrase: "mammal crunch speed person arctic claw wolf chef crisp mirror program slim isolate behave object",
         entropy: "86a69f4451a0b2543f313a33b1b2afe5e76828e6".hex!,
         seed: "96944f0c6f28a5c9e6a9f981c9694b7fe98d9a9c00e1c840948308409cba54b55ef5486851bb5d905eef604fb6a6036144319b77221d42bafad40b34379f1825".hex!,
         password: "test2"),
        (phrase: "drip exact crane fade erase voice soccer jump middle faculty online entry access stove rib wine baby stand",
         entropy: "4329c8c928e4c7eaf373c78c4a366ba5d015ad6e3fdc111a".hex!,
         seed: "d825c36948b339f2459a6c9acd43b7703b472f15dcdb7a60bee17e9da24bff451fd0b955bfc4207e27c5b4aa8f11c4df0709cff126b1dffbf4376acd38859860".hex!,
         password: ""),
        (phrase: "whale energy penalty another tennis insane monster voyage member cotton layer please injury riot wrestle satoshi moral moral slogan acid sausage",
         entropy: "f9a9428a04cdf2e9e3d7b08ac619f9533743747f95fb8fb1f72f80fb".hex!,
         seed: "48fc434ab7f532f66c5c1bcb1e2b19d1b681e3ebdbc3e4e1226303b5a438f9244b1e654e31c0a3b6d71cbb3ff1bfd358d92b7de2b30bfcf24d4a13d0cf8ccabd".hex!,
         password: "abacaba"),
        (phrase: "install assume ketchup talk giant bone foster flight situate math hurt border deputy grab mesh hope update dream evolve caught erupt win danger thought",
         entropy: "7561bde7eec61a329702c7c9b121bf0ce3b4caa2f36bee8851389234cff68ddf".hex!,
         seed: "29de284e97490a1549cae0a74efd01bf165a261c9a37621737a7b09300214aac0351ca8f26f6754c2d6140d2f5951822814aa14a1e8df08a287b43b555f42a60".hex!,
         password: "blablabla")
    ]
    
    func testMnemonicToEntropy() {
        for (phrase, entropy, _, _) in testCases {
            let mnemonic = try? Mnemonic(mnemonic: phrase.components(separatedBy: " "), wordlist: .english)
            XCTAssertNotNil(mnemonic)
            if let mnemonic = mnemonic {
                XCTAssertEqual(mnemonic.entropy, Array(entropy))
            }
        }
    }
   
    func testEntropyToMnemonic() {
        for (phrase, entropy, _, _) in testCases {
            let mnemonic = try? Mnemonic(entropy: Array(entropy))
            XCTAssertNotNil(mnemonic)
            if let mnemonic = mnemonic {
                XCTAssertEqual(mnemonic.mnemonic(wordlist: .english).joined(separator: " "), phrase)
            }
        }
    }
    
    func testSeed() {
        for (_, entropy, seed, password) in testCases {
            let mnemonic = try? Mnemonic(entropy: Array(entropy))
            XCTAssertNotNil(mnemonic)
            if let mnemonic = mnemonic {
                XCTAssertEqual(mnemonic.seed(password: password, wordlist: .english), Array(seed))
            }
        }
    }
    
    
    func testInvalidMnemonic() {
        XCTAssertThrowsError(try Mnemonic(mnemonic: "sleep kitten".components(separatedBy: " ")))
        XCTAssertThrowsError(try Mnemonic(mnemonic: "sleep kitten sleep kitten sleep kitten".components(separatedBy: " ")))
        XCTAssertThrowsError(try Mnemonic(mnemonic: "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon about end grace oxygen maze bright face loan ticket trial leg cruel lizard bread worry reject journey perfect chef section caught neither install industry".components(separatedBy: " ")))
        XCTAssertThrowsError(try Mnemonic(mnemonic: "turtle front uncle idea crush write shrug there lottery flower risky shell".components(separatedBy: " ")))
        XCTAssertThrowsError(try Mnemonic(mnemonic: "sleep kitten sleep kitten sleep kitten sleep kitten sleep kitten sleep kitten".components(separatedBy: " ")))
    }
}
