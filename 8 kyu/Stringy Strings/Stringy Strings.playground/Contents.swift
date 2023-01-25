import Foundation

// https://www.codewars.com/kata/563b74ddd19a3ad462000054/train/swift

func stringy1(_ size: Int) -> String {
    (1...size).map { $0 % 2 == 0 ? "0" : "1" }.joined()
}

// MARK: - Others

func stringy2(_ size: Int) -> String {
    if size % 2 == 0 {
        return String(repeating: "10", count: size / 2)
    } else {
        return "1" + String(repeating: "01", count: size / 2)
    }
}


func stringy(_ size: Int) -> String {
    (1...size).map { "\($0 % 2)" }.joined()
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(stringy(1), "1")
        XCTAssertEqual(stringy(2), "10")
        XCTAssertEqual(stringy(3), "101")
    }
}

SolutionTest.defaultTestSuite.run()
