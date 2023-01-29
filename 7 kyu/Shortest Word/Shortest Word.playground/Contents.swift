import Foundation

// https://www.codewars.com/kata/56541980fa08ab47a0000040/train/swift

func find_short(_ str: String) -> Int {
    str.components(separatedBy: " ").map { $0.count }.min() ?? 0
}

func find_short2(_ str: String) -> Int { // OK
    return str.split(separator: " ").sorted { $0.count < $1.count }[0].count
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(3, find_short("bitcoin take over the world maybe who knows perhaps"))
        XCTAssertEqual(3, find_short("lets talk about javascript the best language"))
        XCTAssertEqual(1, find_short("i want to travel the world writing code one day"))
        XCTAssertEqual(2, find_short("Lets all go on holiday somewhere very cold"))
        XCTAssertEqual(2, find_short("Let's travel abroad shall we"))
    }
}

SolutionTest.defaultTestSuite.run()
