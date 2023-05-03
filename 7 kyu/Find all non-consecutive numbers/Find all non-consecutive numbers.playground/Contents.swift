import Foundation

// https://www.codewars.com/kata/58f8b35fda19c0c79400020f/train/swift

func allNonConsecutive(_ arr: [Int]) -> [(Int, Int)] {
    var result: [(Int, Int)] = []
    var prev: Int = 0
    
    for (index, element) in arr.enumerated() {
        if index != 0, element - prev != 1 {
            result.append((index, element))
        }
        prev = element
    }
    
    return result
}

func allNonConsecutive2(_ arr: [Int]) -> [(Int, Int)] {
    arr.enumerated().dropFirst().filter { arr[$0.0 - 1] != $0.1 - 1 }
}

// MARK: Tests

import XCTest

func ==<T1: Equatable, T2: Equatable>(lhs: (T1,T2), rhs: (T1,T2)) -> Bool {
    return lhs.0 == rhs.0 && lhs.1 == rhs.1
}

func ==<T1: Equatable, T2: Equatable>(lhs: [(T1,T2)], rhs: [(T1,T2)]) -> Bool {
    return lhs.elementsEqual(rhs, by: ==)
}

class SolutionTest: XCTestCase {
    func test() {
        let results = allNonConsecutive([1,2,3,4,6,7,8,10])
        XCTAssertTrue(results == [(4, 6), (7, 10)])
    }
}

SolutionTest.defaultTestSuite.run()
