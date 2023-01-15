import Foundation

// https://www.codewars.com/kata/515e271a311df0350d00000f/train/swift

func squareSum(_ vals: [Int]) -> Int {
    vals.reduce(0, { $0 + $1 * $1 } )
}


// MARK: - Others


// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("testNoValue", testNoValue),
        ("testOneValue", testOneValue),
        ("testTwoValues", testTwoValues),
        ("testThreeValues", testThreeValues),
    ]
  
    func testNoValue() {
        XCTAssertEqual(squareSum([]), 0)
    }
  
    func testOneValue() {
        XCTAssertEqual(squareSum([1]), 1)
    }
    
    func testTwoValues() {
        XCTAssertEqual(squareSum([1, 2]), 5)
        XCTAssertEqual(squareSum([3, 4]), 25)
        XCTAssertEqual(squareSum([-3, -4]), 25)
    }
    
    func testThreeValues() {
        XCTAssertEqual(squareSum([1, 2, 3]), 14)
        XCTAssertEqual(squareSum([5, 3, 4]), 50)
        XCTAssertEqual(squareSum([-3, -4, 0]), 25)
    }
}

SolutionTest.defaultTestSuite.run()
