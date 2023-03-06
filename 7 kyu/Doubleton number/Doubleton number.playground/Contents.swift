import Foundation

// https://www.codewars.com/kata/604287495a72ae00131685c7/train/swift

func doubleton2(_ num: Int) -> Int {
    var number = num + 1
    while Set(String(number)).count != 2 {
        number += 1
    }
    return number
}

func doubleton(_ num: Int) -> Int {
    Set(String(num + 1)).count == 2 ? num + 1 : doubleton(num + 1)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    static var allTests = [
        ("Fixed Tests", tests),
    ]

    func tests() {
        let testCases = [
            (130, 131),
            (1434, 1441),
            (20, 21),
            (5, 10),
            (131, 133)
        ]
        
        for testCase in testCases {
            XCTAssertEqual(doubleton(testCase.0), testCase.1)
        }
    }
}

SolutionTest.defaultTestSuite.run()
