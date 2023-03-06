import Foundation

// https://www.codewars.com/kata/57ad85bb7cb1f3ae7c000039/train/swift

func numbersWithDigitInside(_ x: Int64, _ d: Int64) -> [Int64] {
    let numbers = (1...Int(x)).filter { String($0).contains(String(d)) }
    return [numbers.count, numbers.reduce(0, +), numbers.count == 0 ? 0 : numbers.reduce(1, *)].map { Int64($0) }
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(numbersWithDigitInside(5,6), [0, 0, 0])
        XCTAssertEqual(numbersWithDigitInside(7,6), [1, 6, 6])
        XCTAssertEqual(numbersWithDigitInside(11,1), [3, 22, 110])
        XCTAssertEqual(numbersWithDigitInside(20,0), [2, 30, 200])
        XCTAssertEqual(numbersWithDigitInside(44,4), [9, 286, 5955146588160])
    }
}

SolutionTest.defaultTestSuite.run()
