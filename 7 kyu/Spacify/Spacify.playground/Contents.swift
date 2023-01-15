import Foundation

// https://www.codewars.com/kata/56541980fa08ab47a0000040/train/swift

func spacify(_ str: String) -> String {
    str.map(String.init).joined(separator: " ")
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(spacify("hello world"), "h e l l o   w o r l d")
        XCTAssertEqual(spacify("12345"),"1 2 3 4 5")
        XCTAssertEqual(spacify(""), "")
        XCTAssertEqual(spacify("a"),"a")
        XCTAssertEqual(spacify("Pippi"),"P i p p i")
    }
}

SolutionTest.defaultTestSuite.run()
