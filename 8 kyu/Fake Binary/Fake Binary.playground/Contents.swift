import Foundation

// Expressions Matter
// https://www.codewars.com/kata/57eae65a4321032ce000002d/train/swift

func fakeBin(digits: String) -> String {
    digits.map { $0 < "5" ? "0" : "1" }.joined()
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(fakeBin(digits: "45385593107843568"), "01011110001100111")
        XCTAssertEqual(fakeBin(digits: "509321967506747"), "101000111101101")
        XCTAssertEqual(fakeBin(digits: "366058562030849490134388085"), "011011110000101010000011011")
        XCTAssertEqual(fakeBin(digits: "15889923"), "01111100")
        XCTAssertEqual(fakeBin(digits: "800857237867"), "100111001111")
        XCTAssertEqual(fakeBin(digits: ""), "")
    }
}

SolutionTest.defaultTestSuite.run()
