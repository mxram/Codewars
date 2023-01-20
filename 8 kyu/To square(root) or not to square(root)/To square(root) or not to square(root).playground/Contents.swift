import Foundation

// https://www.codewars.com/kata/57f6ad55cca6e045d2000627/train/swift

func squareOrSquareRoot(_ input: [Int]) -> [Int] {
    input.map {
        let squareRoot = sqrt(Double($0))
        return floor(squareRoot) == squareRoot ? Int(squareRoot) : $0 * $0
    }
}

func squareOrSquareRoot2(_ input: [Int]) -> [Int] {
    input.map {
        let n = sqrt(Double($0))
        return n == Double(Int(n)) ? Int(n) : $0 * $0
    }
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(squareOrSquareRoot([4, 3, 9, 7, 2, 1]), [2, 9, 3, 49, 4, 1])
        XCTAssertEqual(squareOrSquareRoot([100, 101, 5, 5, 1, 1]), [10, 10201, 25, 25, 1, 1])
        XCTAssertEqual(squareOrSquareRoot([1, 2, 3, 4, 5, 6]), [1, 4, 9, 2, 25, 36])
    }
}

SolutionTest.defaultTestSuite.run()
