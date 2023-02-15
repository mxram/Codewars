import Foundation

// https://www.codewars.com/kata/525e5a1cb735154b320002c8/train/swift

func triangular(_ n: Int) -> Int {
    n > 0 ? (1...n).reduce(0, +) : 0
}

func triangular2(_ n: Int) -> Int {
    guard n > 0 else { return 0 }
    return n * (1 + n) / 2
}

func triangular3(_ n: Int) -> Int {
    if n < 1 { return 0 }
    if n == 1 { return 1 }
    return triangular(n - 1) + n
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(triangular(0), 0)
        XCTAssertEqual(triangular(1), 1)
        XCTAssertEqual(triangular(2), 3)
        XCTAssertEqual(triangular(3), 6)
        XCTAssertEqual(triangular(-10), 0)
    }
}

SolutionTest.defaultTestSuite.run()
