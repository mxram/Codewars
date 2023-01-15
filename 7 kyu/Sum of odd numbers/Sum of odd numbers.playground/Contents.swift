import Foundation

// https://www.codewars.com/kata/55fd2d567d94ac3bc9000064/train/swift

func rowSumOddNumbers(_ row: Int) -> Int {
    var start = row * (row - 1) + 1
    var result = 0
    for _ in 1...row {
        result += start
        start += 2
    }
    
    return result
}

// MARK: - Others

func rowSumOddNumbers2(_ row: Int) -> Int {
    row * row * row
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(rowSumOddNumbers(1), 1)
        XCTAssertEqual(rowSumOddNumbers(2), 8)
        XCTAssertEqual(rowSumOddNumbers(13), 2197)
        XCTAssertEqual(rowSumOddNumbers(19), 6859)
        XCTAssertEqual(rowSumOddNumbers(41), 68921)
        XCTAssertEqual(rowSumOddNumbers(42), 74088)
        XCTAssertEqual(rowSumOddNumbers(74), 405224)
        XCTAssertEqual(rowSumOddNumbers(86), 636056)
        XCTAssertEqual(rowSumOddNumbers(93), 804357)
        XCTAssertEqual(rowSumOddNumbers(101), 1030301)
    }
}

SolutionTest.defaultTestSuite.run()
