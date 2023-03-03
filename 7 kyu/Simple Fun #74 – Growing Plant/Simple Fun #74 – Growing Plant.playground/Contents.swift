import Foundation

// https://www.codewars.com/kata/58941fec8afa3618c9000184/train/swift

func growingPlant(_ upSpeed: Int, _ downSpeed: Int, _ desiredHeight: Int) -> Int {
    var days = 1
    var height = upSpeed
    while height < desiredHeight {
        height += upSpeed - downSpeed
        days += 1
    }
    return days
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.225 (0.226) seconds
class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(growingPlant(100, 10, 910), 10)
        XCTAssertEqual(growingPlant(10, 9, 4), 1)
        XCTAssertEqual(growingPlant(5, 2, 5), 1)
        XCTAssertEqual(growingPlant(5, 2, 6), 2)
    }
}

SolutionTest.defaultTestSuite.run()

