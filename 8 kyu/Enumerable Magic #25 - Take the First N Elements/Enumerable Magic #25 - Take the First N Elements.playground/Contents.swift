import Foundation

// Expressions Matter
// https://www.codewars.com/kata/545afd0761aa4c3055001386/train/swift

func take1(_ arr: [Int], _ n: Int) -> [Int] {
    Array(arr[0 ..< min(n, arr.count)])
}

// MARK: Others

func take(_ arr: [Int], _ n: Int) -> [Int] {
    Array(arr.prefix(n))
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(take([0, 1, 2, 3, 5, 8, 13], 3), [0, 1, 2])
        XCTAssertEqual(take([0, 1, 2, 3, 5, 8, 13], 0), [])
        XCTAssertEqual(take([], 3), [])
    }
}

SolutionTest.defaultTestSuite.run()
