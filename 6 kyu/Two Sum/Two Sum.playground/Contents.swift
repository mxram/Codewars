import Foundation

// https://www.codewars.com/kata/52c31f8e6605bcc646000082/train/swift

class Solution {
    static func twosum(numbers: [Double], target: Double) -> [Int] {
        var numbers = numbers
        var first = numbers.remove(at: 0)
        
        if let index = numbers.firstIndex(of: target - first) {
            return [0, index + 1]
        }
        return twosum(numbers: numbers, target: target).map { $0 + 1 }
    }
}

// Solution 2:
/*
class Solution {
    static func twosum(numbers: [Double], target: Double) -> [Int] {
        for i in 0..<(numbers.count - 1) {
            for k in (i+1)..<numbers.count where numbers[i] + numbers[k] == target {
                return [i,k]
            }
        }
        return []
    }
}

// Solution 3:
class Solution {
    static func twosum(numbers: [Double], target: Double) -> [Int] {
        var pairs = [Double:Double]()
        for (i,n) in numbers.enumerated() {
            if let pi = pairs[target - n] {
                return [Int(pi),i]
            } else {
                pairs[Double(n)] = Double(i)
            }
        }
        return []
    }
}
*/

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test 1 - [1,54,24,35], 59 -> [2,3]", test1)
    ]

    func test1() {
        let actual = [2,3]
        XCTAssertEqual(actual, Solution.twosum(numbers: [1,54,24,35], target: 59))
    }
}

SolutionTest.defaultTestSuite.run()
