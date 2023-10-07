import Foundation

// https://www.codewars.com/kata/56bc28ad5bdaeb48760009b0/train/swift

func removeFirstAndLast(_ str: String) -> String {
    var str = str
    str.removeFirst()
    str.removeLast()
    return str
}

func removeFirstAndLast2(_ str: String) -> String {
    String(str.dropFirst().dropLast())
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(removeFirstAndLast("eloquent"), "loquen")
        XCTAssertEqual(removeFirstAndLast("country"), "ountr")
        XCTAssertEqual(removeFirstAndLast("person"), "erso")
        XCTAssertEqual(removeFirstAndLast("place"), "lac")
        XCTAssertEqual(removeFirstAndLast("ooopsss"), "oopss")
    }
}

SolutionTest.defaultTestSuite.run()
