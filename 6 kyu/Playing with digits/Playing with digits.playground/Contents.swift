import Foundation

// https://www.codewars.com/kata/5552101f47fc5178b1000050/train/swift

func digPow(for number: Int, using power: Int) -> Int {
    let n = String(number)
        .compactMap { $0.wholeNumberValue }
        .enumerated()
        .reduce(0) {
            $0 + Int(pow(Double($1.1), Double(power + $1.0)))
        }
    return n % number == 0 ? n / number : -1
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(digPow(for: 89, using: 1), 1)
        XCTAssertEqual(digPow(for: 92, using: 1), -1)
        XCTAssertEqual(digPow(for: 695, using: 2), 2)
        XCTAssertEqual(digPow(for: 46288, using: 3), 51)
    }
}

SolutionTest.defaultTestSuite.run()
