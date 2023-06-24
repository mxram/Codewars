import Foundation

// https://www.codewars.com/kata/5c5086287bc6600001c7589a/train/swift

func isNegativeZero(_ n: Float) -> Bool {
    n.floatingPointClass == .negativeZero
}

func isNegativeZero2(_ n: Float) -> Bool {
    n == 0 && n.sign == .minus
}

func isNegativeZero3(_ n: Float) -> Bool {
    String(n) == "-0.0"
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertFalse(isNegativeZero(0.0))
        XCTAssertTrue(isNegativeZero(-0.0))
        XCTAssertFalse(isNegativeZero(Float.infinity))
        XCTAssertFalse(isNegativeZero(-Float.infinity))
        XCTAssertFalse(isNegativeZero(-1.0))
        XCTAssertFalse(isNegativeZero(0.0))
        XCTAssertFalse(isNegativeZero(1.0))
        XCTAssertFalse(isNegativeZero(-Float.leastNonzeroMagnitude))
    }
}

SolutionTest.defaultTestSuite.run()
