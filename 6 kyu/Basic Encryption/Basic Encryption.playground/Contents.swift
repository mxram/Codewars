import Foundation

// https://www.codewars.com/kata/5862fb364f7ab46270000078/train/swift


func encrypt(text: String, rule: Int) -> String {
    text.compactMap { UnicodeScalar((Int($0.asciiValue ?? 0) + rule) % 256)?.description }.joined()
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(encrypt(text: "a", rule: 1), "b")
        XCTAssertEqual(encrypt(text: "please encrypt me", rule: 2), "rngcug\"gpet{rv\"og")
    }
}

SolutionTest.defaultTestSuite.run()
