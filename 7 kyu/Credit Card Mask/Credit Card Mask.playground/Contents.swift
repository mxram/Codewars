import Foundation

//https://www.codewars.com/kata/558fc85d8fd1938afb000014/train/swift

func sumOfTwoSmallestIntegersIn(_ array: [Int]) -> Int {
    let sorted = array.sorted()
    return sorted[0] + sorted[1]
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([5, 8, 12, 18, 22]), 13)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([7, 15, 12, 18, 22]), 19)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([25, 42, 12, 18, 22]), 30)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([1, 8, 12, 18, 5]), 6)
        XCTAssertEqual(sumOfTwoSmallestIntegersIn([13, 12, 5, 61, 22]), 17)
    }
}

SolutionTest.defaultTestSuite.run()
