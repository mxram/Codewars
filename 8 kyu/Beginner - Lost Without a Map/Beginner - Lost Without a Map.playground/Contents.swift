import Foundation

// https://www.codewars.com/kata/57f781872e3d8ca2a000007e/train/swift

func maps(a : Array<Int>) -> Array<Int> {
    a.map { $0 * 2 }
}

// MARK: - Solution 2: -




// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Works for some examples", testExample),
        ("Works for empty array", testEmptyArray)
    ]

    func testExample() {
        XCTAssertEqual(maps(a: [1,2,3,4,5]), [2,4,6,8,10])
        XCTAssertEqual(maps(a: [1,-2,3,4,5]), [2, -4, 6, 8, 10])
        XCTAssertEqual(maps(a: [-1,2,3,4,-5]), [-2, 4, 6, 8, -10])
    }
    
    func testEmptyArray() {
        XCTAssertEqual(maps(a: []), []);
    }
}

SolutionTest.defaultTestSuite.run()
