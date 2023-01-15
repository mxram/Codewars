import Foundation

// https://www.codewars.com/kata/538835ae443aae6e03000547/train/swift

func funAdd(_ n: Int) -> ((Int) -> Int) {
    { n + $0 }
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(funAdd(1)(3), 4, "add(1)(3) does not equal 4")
        XCTAssertEqual(funAdd(2)(2), 4, "add(2)(2) does not equal 4")
        XCTAssertEqual(funAdd(0)(-15), -15, "add(0)(-15)")
        XCTAssertEqual(funAdd(10)(3), 13, "add(10)(3) does not equal 13")
        XCTAssertEqual(funAdd(100)(23), 123, "add(100)(23) does not equal 123")
    }
}

SolutionTest.defaultTestSuite.run()
