import Foundation

// https://www.codewars.com/kata/58841cb52a077503c4000015/train/swift

func circleOfNumbers(_ n: Int, _ fst: Int) -> Int {
    n / 2 > fst ? n / 2 + fst : fst - n / 2
}

func circleOfNumbers2(_ n: Int, _ fst: Int) -> Int {
    return (fst + n / 2) % n
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.225 (0.226) seconds
class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(circleOfNumbers(10, 2), 7)
        XCTAssertEqual(circleOfNumbers(10, 7), 2)
        XCTAssertEqual(circleOfNumbers(4, 1), 3)
        XCTAssertEqual(circleOfNumbers(6, 3), 0)
        XCTAssertEqual(circleOfNumbers(20, 0), 10)
    }
}

SolutionTest.defaultTestSuite.run()

