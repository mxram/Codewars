import Foundation

// https://www.codewars.com/kata/5a4d303f880385399b000001/train/swift

func strongNumber(_ number: Int) -> String {
    let sum = String(number)
        .compactMap { $0.wholeNumberValue }
        .map { $0 > 1 ? (1...$0).reduce(1, *) : $0 }
        .reduce(0, +)
    
    return sum == number ? "STRONG!!!!" : "Not Strong !!"
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func tests() {
        XCTAssertEqual(strongNumber(1), "STRONG!!!!")
        XCTAssertEqual(strongNumber(2), "STRONG!!!!")
        XCTAssertEqual(strongNumber(145), "STRONG!!!!")
        XCTAssertEqual(strongNumber(7), "Not Strong !!")
        XCTAssertEqual(strongNumber(93), "Not Strong !!")
        XCTAssertEqual(strongNumber(185), "Not Strong !!")
    }
}

SolutionTest.defaultTestSuite.run()
