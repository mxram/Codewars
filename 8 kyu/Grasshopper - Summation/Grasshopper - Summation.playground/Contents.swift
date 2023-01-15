import Foundation

// https://www.codewars.com/kata/55d24f55d7dd296eb9000030/train/swift

func summation(_ n: Int) -> Int {
    (1...n).reduce(0, +)
}

// MARK: - Others

func summation2(_ n: Int) -> Int {
    n * (1 + n) / 2
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(summation(1), 1)
        XCTAssertEqual(summation(8), 36)
        XCTAssertEqual(summation(22), 253)
        XCTAssertEqual(summation(100), 5050)
        XCTAssertEqual(summation(213), 22791)
    }
}

SolutionTest.defaultTestSuite.run()
