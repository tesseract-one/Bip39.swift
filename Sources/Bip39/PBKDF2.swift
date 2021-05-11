//
//  PBKDF2.swift
//
//
//  Created by Yehor Popovych on 10.05.2021.
//

import Foundation

public struct PBKDF2 {
    public struct Error: Swift.Error {
        public let code: Int
    }
    
    public static func sha512(
        password: [UInt8], salt: [UInt8], iterations: Int = 2048, keyLength: Int = 64
    ) throws -> [UInt8] {
        try sha512native(password: password, salt: salt,
                         iterations: iterations, keyLength: keyLength)
    }
}

#if canImport(CommonCrypto)
import CommonCrypto

extension PBKDF2 {
    fileprivate static func sha512native(
        password: [UInt8], salt: [UInt8], iterations: Int, keyLength: Int
    ) throws -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: keyLength)

        let status: Int32 = password.withUnsafeBytes { pptr in
            let passwdPtr = pptr.bindMemory(to: CChar.self)
            return CCKeyDerivationPBKDF(
                CCPBKDFAlgorithm(kCCPBKDF2),
                passwdPtr.baseAddress,
                passwdPtr.count,
                salt,
                salt.count,
                CCPBKDFAlgorithm(kCCPRFHmacAlgSHA512),
                UInt32(iterations),
                &bytes,
                keyLength
            )
        }

        guard status == kCCSuccess else {
            throw Error(code: Int(status))
        }
        return bytes
    }
}
#else
import CBip39Crypto

extension PBKDF2 {
    fileprivate static func sha512native(
        password: [UInt8], salt: [UInt8], iterations: Int, keyLength: Int
    ) throws -> [UInt8] {
        var key = [UInt8](repeating: 0, count: keyLength)
        pbkdf2_hmac_sha512(password, Int32(password.count), salt, Int32(salt.count), UInt32(iterations), &key, Int32(keyLength))
        return key
    }
}
#endif
