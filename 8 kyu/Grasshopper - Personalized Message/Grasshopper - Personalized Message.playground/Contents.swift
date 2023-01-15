import Foundation

// https://www.codewars.com/kata/5772da22b89313a4d50012f7/train/swift

func great(_ name: String, _ owner: String) -> String {
    "Hello " + (name == owner ? "boss" : "guest")
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(great("Daniel", "Daniel"), "Hello boss")
        XCTAssertEqual(great("Greg", "Daniel"), "Hello guest")
        XCTAssertEqual(great("Bill", "Daniel"), "Hello guest")
        XCTAssertEqual(great("Mary", "Mary"), "Hello boss")
        XCTAssertEqual(great("Kate", "Bob"), "Hello guest")
    }
}

SolutionTest.defaultTestSuite.run()
