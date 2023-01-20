import Foundation

// https://www.codewars.com/kata/5d5ee4c35162d9001af7d699/train/swift

func sumOfMinimums(_ numbers: [[Int]]) -> Int {
    numbers.compactMap { $0.min() }.reduce(0, +)
}

func sumOfMinimums2
(_ numbers: [[Int]]) -> Int {
    numbers.reduce(0, { $0 + ($1.min() ?? 0) })
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.225 (0.226) seconds
class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]

    func testExample() {
        XCTAssertEqual(5, sumOfMinimums([[2,8,5,4,3], [8,3,4,5,6]]))
        XCTAssertEqual(25, sumOfMinimums([[1,6,3,11,32], [21,32,45,24,34], [8,12,13,6,3]]))
        XCTAssertEqual(61, sumOfMinimums([[7,1,4,3,6],[9,3,13,24,25],[23,35,37,47,56],[12,32,35,58,53],[22,24,35,47,56]]))
    }
}

SolutionTest.defaultTestSuite.run()

