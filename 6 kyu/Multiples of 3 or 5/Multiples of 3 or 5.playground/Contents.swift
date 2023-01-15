import Foundation

// https://www.codewars.com/kata/514b92a657cdc65150000006/train/swift

func solution2(_ num: Int) -> Int {
    guard num > 0 else {
        return 0
    }
    
    var result = 0
    for n in 0..<num {
        if n % 3 == 0 || n % 5 == 0 {
            result += n
        }
    }
    
    return result
}

// MARK: - Others

func solution(_ num: Int) -> Int {
    guard num > 3 else { return 0 }
    return (3..<num).filter { $0 % 3 == 0 || $0 % 5 == 0 }.reduce(0, +)
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(solution(10), 23)
        XCTAssertEqual(solution(20), 78)
        XCTAssertEqual(solution(200), 9168)
    }
}

SolutionTest.defaultTestSuite.run()
