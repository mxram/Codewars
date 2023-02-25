import Foundation

// https://www.codewars.com/kata/595aa94353e43a8746000120/train/swift

func findDeletedNumber(_ array: [Int], _ mixArray: [Int]) -> Int {
    array.first(where: { !mixArray.contains($0) }) ?? 0
}

func findDeletedNumber2(_ array: [Int], _ mixArray: [Int]) -> Int {
    array.reduce(0, +) - mixArray.reduce(0, +)
}

func findDeletedNumber3(_ array: [Int], _ mixArray: [Int]) -> Int {
    mixArray.reduce(array.reduce(0, ^), ^)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(findDeletedNumber([1,2,3,4,5,6,7,8,9],[3,2,4,6,7,8,1,9]), 5)
    }
}

SolutionTest.defaultTestSuite.run()
