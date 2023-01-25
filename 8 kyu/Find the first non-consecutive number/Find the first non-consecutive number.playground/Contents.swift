import Foundation

// https://www.codewars.com/kata/58f8a3a27a5c28d92e000144/train/swift

func firstNonConsecutive (_ arr: [Int]) -> Int? {
    guard arr.count > 1 else {
        return nil
    }
    var previous: Int?
    return arr.first {
        guard let prev = previous else {
            previous = $0
            return false
        }
        let result = $0 - prev != 1
        previous = $0
        
        return result
    }
}

func firstNonConsecutive2(_ arr: [Int]) -> Int? {
    guard arr.count > 0 else { return nil }
    for i in 1..<arr.count where arr[i-1] + 1 != arr[i] { return arr[i] }
    return nil
}

func firstNonConsecutive3(_ arr: [Int]) -> Int? { // the best
    guard arr.count > 1 else {
        return nil
    }
    var num = arr[0]

    for number in arr {
        if number == num {
            num += 1
        } else {
            return number
        }
    }
    
    return nil
}

// func firstNonConsecutive (_ arr: [Int]) -> Int? {
//     for i in 1..<arr.count where arr[i] - arr[i-1] > 1 { return arr[i] }
//     return nil
// }

// func firstNonConsecutive (_ arr: [Int]) -> Int? {
//     return arr.enumerated().first{$0 > 0 ? arr[$0-1] + 1 != $1 : false}?.element
// }

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        let first = firstNonConsecutive([1,2,3,4,6,7,8])
        XCTAssertEqual(first, 6)
    }
}

SolutionTest.defaultTestSuite.run()
