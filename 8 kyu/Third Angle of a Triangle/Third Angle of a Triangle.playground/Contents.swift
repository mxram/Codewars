import Foundation

// https://www.codewars.com/kata/5a023c426975981341000014/train/swift

func otherAngle(a: Int, b: Int) -> Int {
    180 - a - b
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(otherAngle(a:30, b:60), 90, "Incorrect result for a:30 b:60")
        XCTAssertEqual(otherAngle(a:60, b:60), 60, "Incorrect result for a:60 b:60")
        XCTAssertEqual(otherAngle(a:43, b:78), 59, "Incorrect result for a:43 b:78")
        XCTAssertEqual(otherAngle(a:10, b:20), 150, "Incorrect result for a:10 b:20")
    }
}

SolutionTest.defaultTestSuite.run()
