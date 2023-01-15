import Foundation

// https://www.codewars.com/kata/542c0f198e077084c0000c2e/train/swift

func divisors(_ n: UInt32) -> UInt32 {
    var count: UInt32 = 0
    for num in 1...n {
        if n % num == 0 {
            count += 1
        }
    }
    return count
}

// MARK: - Others

func divisors2(_ n: UInt32) -> UInt32 {
    UInt32((1...n).lazy.filter { n % $0 == 0 }.count)
}


// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(divisors(1), 1)
    }
}

SolutionTest.defaultTestSuite.run()
