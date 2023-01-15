import Foundation

// https://www.codewars.com/kata/541c8630095125aba6000c00/train/swift

func digitalRoot(of number: Int) -> Int {
    if number < 10 {
        return number
    } else {
        return digitalRoot(of: number % 10 + digitalRoot(of: number / 10))
    }
}

// MARK: - Others

func digitalRoot1(of number: Int) -> Int {
    return (number - 1) % 9 + 1 // success
}

func digitalRoot2(of number: Int) -> Int {
    let d = "\(number)".compactMap{ Int("\($0)")}.reduce(0,+)
    return d > 9 ? digitalRoot(of: d) : d
}

func digitalRoot3(of number: Int) -> Int {
    guard number > 0 else {
        return 0
    }
    
    var result = 0
    result += number % 10 + digitalRoot3(of: number / 10)
    
    return result % 10 + digitalRoot3(of: result / 10)
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(digitalRoot(of: 16), 7)
        XCTAssertEqual(digitalRoot(of: 456), 6)
        XCTAssertEqual(digitalRoot(of: 0), 0)
        XCTAssertEqual(digitalRoot(of: 12345), 6)
        XCTAssertEqual(digitalRoot(of: 99999999999999), 9)
    }
}

SolutionTest.defaultTestSuite.run()
