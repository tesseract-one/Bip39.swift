//
//  SHA256.swift
//  
//
//  Created by Yehor Popovych on 10.05.2021.
//

import Foundation

public struct SHA256 {
    public static func hash(_ bytes: [UInt8]) -> [UInt8] {
        native(bytes: bytes)
    }
}

#if canImport(CommonCrypto)
import CommonCrypto

extension SHA256 {
    fileprivate static func native(bytes: [UInt8]) -> [UInt8] {
        var out = [UInt8](repeating: 0, count: Int(CC_SHA256_DIGEST_LENGTH))
        CC_SHA256(bytes, CC_LONG(bytes.count), &out)
        return out
    }
}
#else
import CBip39Crypto

extension SHA256 {
    fileprivate static func native(bytes: [UInt8]) -> [UInt8] {
        var out = [UInt8](repeating: 0, count: Int(SHA256_DIGEST_LENGTH))
        sha256_Raw(bytes, bytes.count, &out)
        return out
    }
}
#endif
