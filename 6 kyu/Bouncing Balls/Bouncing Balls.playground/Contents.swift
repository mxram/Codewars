import Foundation

// https://www.codewars.com/kata/5544c7a5cb454edb3c000047/train/swift

func bouncingBall(_ h: Double, _ bounce: Double, _ window: Double) -> Int {
    guard h > 0, bounce > 0, bounce < 1, window < h else {
        return -1
    }
    var result = 1
    var height = bounce * h
    while height > window {
        result += 2
        height *= bounce
    }
    return result
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("bouncingBall", testExample),
    ]

    func testequal(_ h: Double, _ bounce: Double, _ window: Double, _ expected: Int) {
        XCTAssertEqual(bouncingBall(h, bounce, window), expected)
    }

    func testExample() {
        testequal(3, 0.66, 1.5, 3)
        testequal(30, 0.66, 1.5, 15)
        testequal(10, 0.6, 10, -1)
        testequal(40, 1, 10, -1)
    }
}

SolutionTest.defaultTestSuite.run()
