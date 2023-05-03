import Foundation

// https://www.codewars.com/kata/5834fec22fb0ba7d080000e8/train/swift

func sixToast(_ num: Int) -> Int {
    abs(6 - num)
}

// MARK: - Tests -
import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Sample Test Cases", testSample),
    ]

    func testSample() {
        XCTAssertEqual(sixToast(15), 9, "Incorrect answer for num = 15")
        XCTAssertEqual(sixToast(6), 0, "Incorrect answer for num = 6")
        XCTAssertEqual(sixToast(7), 1, "Incorrect answer for num = 7")
        XCTAssertEqual(sixToast(4), 2, "Incorrect answer for num = 4")
    }
}

SolutionTest.defaultTestSuite.run()
