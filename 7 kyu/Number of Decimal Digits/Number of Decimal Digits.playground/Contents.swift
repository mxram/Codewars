import Foundation

// https://www.codewars.com/kata/58fa273ca6d84c158e000052/train/swift

func digits(num n: UInt64) -> Int {
    String(n).count
}

// MARK: Tests

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.400 (0.402) seconds
class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(1,  digits(num: 5))
        XCTAssertEqual(5,  digits(num: 12345))
        XCTAssertEqual(10, digits(num: 9876543210))
    }
}

SolutionTest.defaultTestSuite.run()
