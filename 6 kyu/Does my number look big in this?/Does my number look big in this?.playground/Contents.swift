import Foundation

// https://www.codewars.com/kata/5287e858c6b5a9678200083c/train/swift

func isNarcissistic(_ n: Int64) -> Bool {
    Decimal(n) == "\(n)".compactMap { $0.wholeNumberValue }.map { pow(Decimal($0), "\(n)".count) }.reduce(0, +)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(true, isNarcissistic(7), "Should return true for 7")
        XCTAssertEqual(false, isNarcissistic(12), "Should return false for 12")
        XCTAssertEqual(true, isNarcissistic(370), "Should return true for 370")
        XCTAssertEqual(true, isNarcissistic(371), "Should return true for 371")
        XCTAssertEqual(true, isNarcissistic(1634), "Should return true for 1634")
        XCTAssertEqual(true, isNarcissistic(4929273885928088826), "Should return true for 4929273885928088826")
        XCTAssertEqual(true, isNarcissistic(4498128791164624869), "Should return true for 4498128791164624869")
        XCTAssertEqual(true, isNarcissistic(35875699062250035), "Should return true for 35875699062250035")
    }
}

SolutionTest.defaultTestSuite.run()
