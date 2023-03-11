import Foundation

// https://www.codewars.com/kata/5526fc09a1bbd946250002dc/train/swift

func findOutlier(_ array: [Int]) -> Int {
    let first = array.first ?? 0
    let last = array.last ?? 0
    let isFirstEven = first.isMultiple(of: 2)

    if isFirstEven == last.isMultiple(of: 2) {
        return array.first(where: { $0.isMultiple(of: 2) != isFirstEven  } ) ?? first
    } else {
        return array[1].isMultiple(of: 2) == isFirstEven ? last : first
    }
}

// MARK: Others

/*
func findOutlier(_ array: [Int]) -> Int {
    array.first(where: array[0...2].map{ $0 & 1 }.reduce(0, +) > 1 ? { $0 & 1 == 0 } : { $0 & 1 == 1 })!
}
*/

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(findOutlier([1, 33, 10053359313, 2, 1, 1, 1, 1, 1, 1, -3, 9]), 2)
        XCTAssertEqual(findOutlier([8, 80, 14, 2, 20, 0, 21, 80]), 21)
    }
}

SolutionTest.defaultTestSuite.run()
