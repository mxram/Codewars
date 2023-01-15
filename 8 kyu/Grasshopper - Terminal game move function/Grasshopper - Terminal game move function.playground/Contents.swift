import Foundation

// https://www.codewars.com/kata/563a631f7cbbc236cf0000c2/train/swift

func move(_ p: Int, _ r: Int) -> Int {
    p + 2 * r
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(move(0, 4), 8)
        XCTAssertEqual(move(3, 6), 15)
        XCTAssertEqual(move(2, 5), 12)
    }
}

SolutionTest.defaultTestSuite.run()
