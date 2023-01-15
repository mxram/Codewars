import Foundation

// https://www.codewars.com/kata/577b9960df78c19bca00007e/train/swift

func findDigit(_ num: Int, _ nth: Int) -> Int {
    guard nth > 0 else {
        return -1
    }
    
    let stringNum = String(abs(num))
    guard stringNum.count >= nth else {
        return 0
    }
    
    return stringNum.reversed()[nth - 1].wholeNumberValue ?? 0
}

// MARK: - Others

func findDigit2(_ num: Int, _ nth: Int) -> Int {
    var num = num
    
    guard nth > 0 else {
        return -1
    }
    guard nth > 1 else {
        return abs(num % 10)
    }
    
    for _ in 1..<nth {
        num /= 10
    }
    
    return abs(num % 10)
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("testNormalValues", testNormalValues),
        ("testNumIsNegative", testNumIsNegative),
        ("testNthNotPositive", testNthNotPositive),
    ]

    func testNormalValues() {
        XCTAssertEqual(findDigit(6429, 3), 4);
    }
    
    func testNumIsNegative() {
        XCTAssertEqual(findDigit(-1234, 2), 3);
    }
    
    func testNthNotPositive() {
        XCTAssertEqual(findDigit(678998, 0), -1);
    }
}

SolutionTest.defaultTestSuite.run()
