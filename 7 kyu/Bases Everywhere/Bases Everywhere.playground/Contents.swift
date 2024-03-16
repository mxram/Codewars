import Foundation

// https://www.codewars.com/kata/5f47e79e18330d001a195b55/train/swift

func baseFinder(_ seq: [String]) -> Int {
    var uniqueDigits = Set<Character>()
    for num in seq {
        for digit in num {
            uniqueDigits.insert(digit)
        }
    }
    return uniqueDigits.count
}

func baseFinder2(_ seq: [String]) -> Int {
    Set(seq.flatMap { $0 }).count
}

func baseFinder3(_ seq: [String]) -> Int {
    return Set(seq.joined()).count
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(baseFinder(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]), 10)
        XCTAssertEqual(baseFinder(["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]), 10)
        XCTAssertEqual(baseFinder(["1", "2", "3", "4", "5", "6", "10", "11", "12", "13"]), 7)
        XCTAssertEqual(baseFinder(["301", "302", "303", "304", "305", "310", "311", "312", "313", "314"]), 6)
        XCTAssertEqual(baseFinder(["50", "51", "61", "53", "54", "60", "52", "62", "55", "56"]), 7)
    }
}

SolutionTest.defaultTestSuite.run()
