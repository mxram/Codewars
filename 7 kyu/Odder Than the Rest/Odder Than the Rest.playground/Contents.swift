import Foundation

// https://www.codewars.com/kata/54da5a58ea159efa38000836/train/swift

func oddOne(_ arr: [Int]) -> Int? {
    arr.firstIndex { $0 % 2 != 0 }
}

// MARK: Others

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(oddOne([2,4,6,7,10]), 3)
        XCTAssertEqual(oddOne([2,16,98,10,13,78]), 4)
        XCTAssertEqual(oddOne([4,-8,98,-12,-7,90,100]), 4)
        XCTAssertEqual(oddOne([2,4,6,8]), nil)
    }
}

SolutionTest.defaultTestSuite.run()
