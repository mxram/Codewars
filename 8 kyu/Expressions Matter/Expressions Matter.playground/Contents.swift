import Foundation

// Expressions Matter
// https://www.codewars.com/kata/5ae62fcf252e66d44d00008e/train/swift

func expressionMatter1(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a == 1 || b == 1 || c == 1 {
        if (a == b && b == c) || (a == 1 && c == 1) {
            return a + b + c
        } else {
            let result1 = (a + b) * c
            let result2 = a * (b + c)
            return result1 > result2 ? result1 : result2
        }
    } else {
        return a * b * c
    }
}

// MARK: - Solution 2: -

func expressionMatter(_ a: Int, _ b: Int, _ c: Int) -> Int {
    max(a + b + c, (a + b) * c, a * (b + c),  a * b * c)
}


// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(expressionMatter(2, 1, 2), 6)
        XCTAssertEqual(expressionMatter(2, 1, 1), 4)
        XCTAssertEqual(expressionMatter(1, 1, 1), 3)
        XCTAssertEqual(expressionMatter(1, 2, 3), 9)
        XCTAssertEqual(expressionMatter(1, 3, 1), 5)
        XCTAssertEqual(expressionMatter(2, 2, 2), 8)
        XCTAssertEqual(expressionMatter(5, 1, 3), 20)
        XCTAssertEqual(expressionMatter(3, 5, 7), 105)
        XCTAssertEqual(expressionMatter(5, 6, 1), 35)
        XCTAssertEqual(expressionMatter(1, 6, 1), 8)
        XCTAssertEqual(expressionMatter(2, 6, 1), 14)
        XCTAssertEqual(expressionMatter(6, 7, 1), 48)
        XCTAssertEqual(expressionMatter(2, 10, 3), 60)
        XCTAssertEqual(expressionMatter(1, 8, 3), 27)
        XCTAssertEqual(expressionMatter(9, 7, 2), 126)
        XCTAssertEqual(expressionMatter(1, 1, 10), 20)
        XCTAssertEqual(expressionMatter(9, 1, 1), 18)
        XCTAssertEqual(expressionMatter(10, 5, 6), 300)
        XCTAssertEqual(expressionMatter(1, 10, 1), 12)
    }
}

SolutionTest.defaultTestSuite.run()
