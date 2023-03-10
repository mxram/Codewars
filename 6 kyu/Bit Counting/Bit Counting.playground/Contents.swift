import Foundation

// https://www.codewars.com/kata/526571aae218b8ee490006f4/train/swift


func countBits(_ n: Int) -> Int {
    String(n, radix: 2).compactMap { $0.wholeNumberValue }.reduce(0, +)
}

// MARK: Others
/*
func countBits(_ n: Int) -> Int {
    return String(n, radix: 2).filter{$0 == "1"}.count
}

func countBits(_ n: Int) -> Int { n.nonzeroBitCount }

func countBits(_ n: Int) -> Int {
    return n > 0 ? countBits(n >> 1) + (n & 1) : 0
}
*/
 
// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(5, countBits(1234));
        XCTAssertEqual(1, countBits(4));
        XCTAssertEqual(3, countBits(7));
        XCTAssertEqual(2, countBits(9));
        XCTAssertEqual(2, countBits(10));
    }
}

SolutionTest.defaultTestSuite.run()
