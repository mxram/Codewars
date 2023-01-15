import Foundation

// https://www.codewars.com/kata/5a662a02e626c54e87000123/train/swift

func extraPerfect(_ n: Int) -> [Int] {
    Array(1...n).filter { $0 % 2 != 0 }
}

func extraPerfect2(_ n: Int) -> [Int] {
    Array(stride(from: 1, through: n, by: 2));
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(extraPerfect(3),  [1, 3]);
        XCTAssertEqual(extraPerfect(5),  [1, 3, 5]);
        XCTAssertEqual(extraPerfect(7),  [1, 3, 5, 7]);
        XCTAssertEqual(extraPerfect(28), [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27]);
        XCTAssertEqual(extraPerfect(39), [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21, 23, 25, 27, 29, 31, 33, 35, 37, 39]);
    }
}

SolutionTest.defaultTestSuite.run()
