import Foundation

// https://www.codewars.com/kata/57a049e253ba33ac5e000212/train/swift

func factorial1(_ n: Int) -> UInt64 {
    (1..<UInt64(n) + 1).reduce(1, *)
}

func factorial(_ n: Int) -> UInt64 {
    n > 0 ? UInt64(n) * factorial(n - 1) : 1
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(factorial(0),    1, "Incorrect result for 0!")
        XCTAssertEqual(factorial(1),    1, "Incorrect result for 1!")
        XCTAssertEqual(factorial(2),    2, "Incorrect result for 2!")
        XCTAssertEqual(factorial(3),    6, "Incorrect result for 3!")
        XCTAssertEqual(factorial(4),   24, "Incorrect result for 4!")
        XCTAssertEqual(factorial(5),  120, "Incorrect result for 5!")
        XCTAssertEqual(factorial(6),  720, "Incorrect result for 6!")
        XCTAssertEqual(factorial(7), 5040, "Incorrect result for 7!")
    }
}

SolutionTest.defaultTestSuite.run()
