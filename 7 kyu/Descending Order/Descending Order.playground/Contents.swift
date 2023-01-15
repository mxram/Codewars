import Foundation

// https://www.codewars.com/kata/5467e4d82edf8bbf40000155/train/swift

func descendingOrder(of number: Int) -> Int {
    Int(String(String(number).sorted(by: >))) ?? 0
}

// MARK: - Others



// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(descendingOrder(of: 0), 0)
        XCTAssertEqual(descendingOrder(of: 15), 51)
        XCTAssertEqual(descendingOrder(of: 123456789), 987654321)
    }
}

SolutionTest.defaultTestSuite.run()
