import Foundation

// https://www.codewars.com/kata/58cb43f4256836ed95000f97/train/swift

func findDifference(_ a: [Int], _ b: [Int]) -> Int {
    abs(a.reduce(1, *) - b.reduce(1, *))
}

// MARK: - Tests -

import XCTest

class Tests: XCTestCase {
    func tests() {
        XCTAssertEqual(findDifference([3, 2, 5], [1, 4, 4]), 14, "\(findDifference([3, 2, 5], [1, 4, 4])) should equal 14")
        XCTAssertEqual(findDifference([9, 7, 2], [5, 2, 2]), 106, "\(findDifference([9, 7, 2], [5, 2, 2])) should equal 106")
    }
}

Tests.defaultTestSuite.run()
