//
//  SecureRandom.swift
//  
//
//  Created by Yehor Popovych on 10.05.2021.
//

import Foundation

public struct SecureRandom {
    public enum Error: Swift.Error {
        case invalidSize
        case nativeGeneratorError(code: Int)
    }
    
    public static func bytes(size: Int) throws -> [UInt8] {
        guard size > 0 && size <= 256 else {
            throw Error.invalidSize
        }
        return try native(size: size)
    }
    
    public static func number<T: BinaryInteger>(_ type: T) throws -> T {
        let bytes = try native(size: MemoryLayout<T>.size)
        return bytes.withUnsafeBytes { $0.load(as: T.self) }
    }
}

#if canImport(Security)
import Security

extension SecureRandom {
    fileprivate static func native(size: Int) throws -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: size)
        let status = SecRandomCopyBytes(kSecRandomDefault, size, &bytes)
        guard status == errSecSuccess else {
            throw Error.nativeGeneratorError(code: Int(status))
        }
        return bytes
    }
}
#elseif canImport(Glibc)
import Glibc

extension SecureRandom {
    fileprivate static func native(size: Int) throws -> [UInt8] {
        var bytes = [UInt8](repeating: 0, count: size)
        guard getentropy(&bytes, size) == 0 else {
            throw Error.nativeGeneratorError(code: Int(errno))
        }
        return bytes
    }
}
#else
#error("SecureRandom isn't implemented for this platform")
#endif
