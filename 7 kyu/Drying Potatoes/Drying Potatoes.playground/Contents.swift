import Foundation

// https://www.codewars.com/kata/58ce8725c835848ad6000007/train/swift

func potatoes (_ p0: Int, _ w0: Int, _ p1: Int) -> Int {
    w0 * (100 - p0) / (100 - p1)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("potatoes", testExample),
    ]

    func dotest(_ p0: Int, _ w0: Int, _ p1: Int, _ exp: Int) {
        let ans = potatoes(p0, w0, p1)
        XCTAssertEqual(ans, exp)
    }

    func testExample() {
        dotest(99, 100, 98, 50)
        dotest(82, 127, 80, 114)
    }
}

SolutionTest.defaultTestSuite.run()
