import Foundation

// https://www.codewars.com/kata/525e5a1cb735154b320002c8/train/swift

func euclideanDistanceBetween(_ point1: [Double], and point2: [Double]) -> Double {
    let result = sqrt(zip(point1, point2).map { pow(($1 - $0), 2) }.reduce(0, +))
    let divisor = pow(10.0, Double(2))
    return (result * divisor).rounded() / divisor
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Distance in 1 dimension", testOne),
        ("Distance in 2 dimensions", testTwo),
        ("Distance in 3 dimensions", testThree)
    ]
    func testOne() {
        XCTAssertEqual(euclideanDistanceBetween([-1], and: [2]), 3.0)
    }
    func testTwo() {
        XCTAssertEqual(euclideanDistanceBetween([-1, 2], and: [2, 4]), 3.61)
    }
    func testThree() {
        XCTAssertEqual(euclideanDistanceBetween([-1, 2, 5], and: [2, 4, 9]), 5.39)
    }
}

SolutionTest.defaultTestSuite.run()
