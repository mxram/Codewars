import Foundation

// https://www.codewars.com/kata/55b95c76e08bd5eef100001e/train/swift

func countArare(_ n: Int) -> String {
    ((0..<(n / 2)).map { _ in "adak" } + (n % 2 != 0 ? ["anane"] : [])).joined(separator: " ")
}

func countArare2(_ n: Int) -> String {
    (Array(repeating: "adak", count: n / 2) + Array(repeating: "anane", count: n % 2)).joined(separator:" ")
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    func test() {
        XCTAssertEqual(countArare(1), "anane")
        XCTAssertEqual(countArare(2), "adak")
        XCTAssertEqual(countArare(3), "adak anane")
        XCTAssertEqual(countArare(5), "adak adak anane")
    }
    
}

SolutionTest.defaultTestSuite.run()
