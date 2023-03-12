import Foundation

// https://www.codewars.com/kata/55bf01e5a717a0d57e0000ec/train/swift

func persistence(for num: Int) -> Int {
    num < 10 ? 0 : 1 + persistence(for: String(num).compactMap { $0.wholeNumberValue }.reduce(1, *))
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Persistence", testPersistence),
        ("Test Persistence", testPersistenceAgain)
    ]

    func testPersistence() {
        XCTAssertEqual(persistence(for: 999), 4)
    }

    func testPersistenceAgain() {
        XCTAssertEqual(persistence(for: 28), 2)
    }
}

SolutionTest.defaultTestSuite.run()
