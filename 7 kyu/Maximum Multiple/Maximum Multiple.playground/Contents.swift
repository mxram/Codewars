import Foundation

// https://www.codewars.com/kata/5aba780a6a176b029800041c/train/swift

func maxMultiple1(_ d: Int, _ b: Int) -> Int {
    var result = b
    while result > 0, result % d != 0 {
        result -= 1
    }
    return result
}

func maxMultiple2(_ d: Int, _ b: Int) -> Int {
    b - b % d
}

func maxMultiple3(_ d: Int, _ b: Int) -> Int {
    return (b / d) * d
}

func maxMultiple(_ d: Int, _ b: Int) -> Int {
    return (0...b).reversed().first(where: { $0 % d == 0}) ?? 0
}

// MARK: - Tests

import XCTest

// Executed 4 tests, with 0 failures (0 unexpected) in 0.400 (0.402) seconds
class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(maxMultiple(2, 7), 6)
        XCTAssertEqual(maxMultiple(3, 10), 9)
        XCTAssertEqual(maxMultiple(7, 17), 14)
        XCTAssertEqual(maxMultiple(10, 50), 50)
        XCTAssertEqual(maxMultiple(37, 200), 185)
        XCTAssertEqual(maxMultiple(7, 100), 98)
    }
}

SolutionTest.defaultTestSuite.run()
