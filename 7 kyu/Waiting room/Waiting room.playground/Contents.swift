import Foundation

// https://www.codewars.com/kata/542f0c36d002f8cd8a0005e5/train/swift

func lastChair(_ n: Int) -> Int {
    return 0
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Sample Tests", testsSample),
    ]

    func testsSample() {
        XCTAssertEqual(lastChair(10), 9)
    }
}

SolutionTest.defaultTestSuite.run()
