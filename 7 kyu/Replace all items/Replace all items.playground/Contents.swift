import Foundation

// https://www.codewars.com/kata/57ae18c6e298a7a6d5000c7a/train/swift

func replaceAll<T: Equatable>(array: [T], old: T, new: T) -> [T] {
    array.map { $0 == old ? new : $0 }
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(replaceAll(array: [1,2,2], old: 1, new: 2), [2,2,2])
        XCTAssertEqual(replaceAll(array: ["ooh", "la", "la"], old: "la", new: "baby"), ["ooh", "baby", "baby"])
    }
}

SolutionTest.defaultTestSuite.run()
