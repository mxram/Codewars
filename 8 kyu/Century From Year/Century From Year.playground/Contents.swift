import Foundation

// https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097/train/swift

func century(_ year: Int) -> Int {
    let century = year / 100
    return year % 100 == 0 ? century : century + 1
}

// MARK: - Others

func century2(_ year: Int) -> Int {
    return Int((Double(year) / 100).rounded(.up))
}

func century3(_ year: Int) -> Int {
    return (year + 99) / 100
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(century(1705), 18)
        XCTAssertEqual(century(1900), 19)
        XCTAssertEqual(century(1601), 17)
        XCTAssertEqual(century(2000), 20)
        XCTAssertEqual(century(89), 1)
    }
}

SolutionTest.defaultTestSuite.run()
