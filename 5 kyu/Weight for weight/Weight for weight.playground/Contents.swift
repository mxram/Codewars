import Foundation

// https://www.codewars.com/kata/55c6126177c9441a570000cc/train/swift

func orderWeight(_ s: String) -> String {
    s.components(separatedBy: " ").sorted {
        func componentsSum(string: String) -> Int {
            string.compactMap { $0.wholeNumberValue }.reduce(0, +)
        }
        let a = componentsSum(string: $0)
        let b = componentsSum(string: $1)
        return a != b ? a < b : $0 < $1
    }
    .joined(separator: " ")
}

func orderWeight2(_ s: String) -> String {
    s.components(separatedBy: " ").sorted()
        .map { ($0, $0.compactMap { $0.wholeNumberValue }.reduce(0, +)) }
        .sorted { $0.1 < $1.1 }.map { $0.0 }.joined(separator: " ")
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("orderWeight", testExample),
    ]

    func testing(_ s: String, _ expected: String) {
        XCTAssertEqual(orderWeight(s), expected)
    }

    func testExample() {
        testing("103 123 4444 99 2000", "2000 103 123 4444 99")
        testing("2000 10003 1234000 44444444 9999 11 11 22 123",
            "11 11 2000 10003 22 123 1234000 44444444 9999")
        testing("", "")
        testing("10003 1234000 44444444 9999 2000 123456789",
            "2000 10003 1234000 44444444 9999 123456789")
    }
}

SolutionTest.defaultTestSuite.run()
