import Foundation

// https://www.codewars.com/kata/58acfe4ae0201e1708000075/train/swift

func inviteMoreWomen(_ arr: [Int]) -> Bool {
    arr.reduce(0, +) > 0
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.225 (0.226) seconds
class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(inviteMoreWomen([1, -1, 1]), true)
        XCTAssertEqual(inviteMoreWomen([-1, -1, -1]), false)
        XCTAssertEqual(inviteMoreWomen([1, -1]), false)
        XCTAssertEqual(inviteMoreWomen([1, 1, 1]), true)
    }
}

SolutionTest.defaultTestSuite.run()

