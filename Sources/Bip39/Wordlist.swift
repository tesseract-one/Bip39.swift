//
//  Wordlist.swift
//  
//
//  Created by Yehor Popovych on 10.05.2021.
//

import Foundation

public struct Wordlist: Hashable, Equatable {
    public let words: [String]
    public let indexes: [String: UInt16]
    
    public init(words: [String]) {
        precondition(words.count == 2048, "Wrong amount of words")
        self.words = words
        let indexTuples = words.enumerated().map { ($0.element, UInt16($0.offset)) }
        self.indexes = Dictionary(uniqueKeysWithValues: indexTuples)
    }
    
    public subscript(index: UInt16) -> String { words[Int(index)] }
    public subscript(word: String) -> UInt16? { indexes[word] }
}
