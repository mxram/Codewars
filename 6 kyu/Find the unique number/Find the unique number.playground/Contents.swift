import Foundation

// https://www.codewars.com/kata/585d7d5adb20cf33cb000235/train/swift

func findUniq(_ arr: [Int]) -> Int {
    let set = NSCountedSet(array: arr)
    return set.first { set.count(for: $0) == 1 } as? Int ?? 0
}

// MARK: Others

func findUniq2(_ arr: [Double]) -> Double {
    arr.filter { arr.firstIndex(of: $0) == arr.lastIndex(of: $0) }.first ?? 0
}

func findUniq3(_ arr: [Int]) -> Int {
    let sorted = arr.sorted(by: <)
    return sorted[0] == sorted[1] ? sorted[sorted.count - 1] : sorted[0]
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(findUniq([ 1, 1, 1, 2, 1, 1 ]), 2)
        XCTAssertEqual(findUniq([ 0, 0, 55, 0, 0 ]), 55)
        XCTAssertEqual(findUniq([ 3, 10, 3, 3, 3 ]), 10)
    }
}

SolutionTest.defaultTestSuite.run()
