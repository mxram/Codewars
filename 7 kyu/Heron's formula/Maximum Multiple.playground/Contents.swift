import Foundation

// https://www.codewars.com/kata/57aa218e72292d98d500240f/train/swift

func heron(_ a: Double, _ b: Double, _ c: Double) -> Double {
    let s = (a + b + c) / 2
    return sqrt(s * (s - a) * (s - b) * (s - c))
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(heron(3, 2, 4), 2.9047375096555625)
    }
}

SolutionTest.defaultTestSuite.run()
