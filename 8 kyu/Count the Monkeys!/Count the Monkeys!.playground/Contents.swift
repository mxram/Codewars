import Foundation

// https://www.codewars.com/kata/56f69d9f9400f508fb000ba7/train/swift

func monkeyCount(_ n: Int) -> [Int] {
    (1...n).map { $0 }
}


func monkeyCount2(_ n: Int) -> [Int] {
    Array(1...n)
}

func monkeyCount3(_ n: Int) -> [Int] {
    return n > 0 ? [Int](1...n) : []
}

/*
func monkeyCount(_ n: Int) -> [Int] {
    return stride(from: 1, through: n, by: 1).sorted()
}
*/

/*
func monkeyCount(_ n: Int) -> [Int] {
    (1...n).sorted()
}
*/


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(monkeyCount(5), [1, 2, 3, 4, 5])
        XCTAssertEqual(monkeyCount(3), [1, 2, 3])
        XCTAssertEqual(monkeyCount(9), [1, 2, 3, 4, 5, 6, 7, 8, 9])
        XCTAssertEqual(monkeyCount(10), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
        XCTAssertEqual(monkeyCount(20), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
    }
}

SolutionTest.defaultTestSuite.run()
