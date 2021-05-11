import XCTest

import Bip39Tests

var tests = [XCTestCaseEntry]()
tests += Bip39Tests.__allTests()

XCTMain(tests)
