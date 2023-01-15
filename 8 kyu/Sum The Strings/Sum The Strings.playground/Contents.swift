import Foundation

// https://www.codewars.com/kata/5966e33c4e686b508700002d/train/swift

func sum_str(_ a:String, _ b:String) -> String {
    String((Int(a) ?? 0) + (Int(b) ?? 0))
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(sum_str("4","5"), "9")
        XCTAssertEqual(sum_str("34","5"), "39")
        XCTAssertEqual(sum_str("9",""), "9")
        XCTAssertEqual(sum_str("",""), "0")
    }
}

SolutionTest.defaultTestSuite.run()
