import Foundation

// https://www.codewars.com/kata/54da5a58ea159efa38000836/train/swift

func findIt(_ seq: [Int]) -> Int {
    var dict = [Int: Int]()
    
    for num in seq {
        let count = dict[num] ?? 0
        dict[num] = count + 1
    }
    
    var find = 0
    dict.forEach { key, value in
        if value % 2 == 1 {
            find = key
        }
    }

    return find
}

// MARK: - Others

func findIt2(_ seq: [Int]) -> Int {
    seq.reduce(0, ^)
}

func findIt3(_ sequence: [Int]) -> Int {
    let set = NSCountedSet(array: sequence)
    let oddElement = set.first { set.count(for: $0) % 2 != 0 }
    guard let oddNumber = oddElement as? Int else {
        fatalError("'sequence' doesn't contain one integer that appears an odd number of times")
    }
    return oddNumber
}

func findIt4(_ seq: [Int]) -> Int {
    for num in Set(seq) {
        if seq.filter({$0 == num}).count % 2 != 0 {
            return num
        }
    }
    return 0
}

func findIt5(_ seq: [Int]) -> Int {
    Dictionary(seq.map { ($0, 1)}, uniquingKeysWith: +)
        .filter { $0.value % 2 == 1}[0]
        .key
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        let testCases = [
            ([20,1,-1,2,-2,3,3,5,5,1,2,4,20,4,-1,-2,5], 5),
            ([1,1,2,-2,5,2,4,4,-1,-2,5], -1),
            ([20,1,1,2,2,3,3,5,5,4,20,4,5], 5),
            ([10], 10),
            ([1,1,1,1,1,1,10,1,1,1,1], 10),
        ]
        for testCase in testCases {
            let actual = findIt(testCase.0);
            let expected = testCase.1;
            XCTAssertEqual(actual, expected, "\nInvalid answer for input array: \(testCase.0)\nExpected: \(expected)\nActual: \(actual)")
        }
    }
}

SolutionTest.defaultTestSuite.run()
