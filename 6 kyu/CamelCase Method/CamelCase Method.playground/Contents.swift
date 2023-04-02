import Foundation

// https://www.codewars.com/kata/587731fda577b3d1b0001196/train/swift

func camelCase(_ str: String) -> String {
    str.components(separatedBy: " ").map { $0.capitalized }.joined()
}

/*
func camelCase(_ str: String) -> String {
    return str.capitalized.replacingOccurrences(of: " ", with: "")
}

func camelCase(_ str: String) -> String {
    return str.capitalized.split(separator: " ").joined()
}

func camelCase(_ str: String) -> String {
    return str.capitalized.filter { $0 != " " }
}
*/

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {

    static var allTests = [
        ("Basic Tests", testBasics),
    ]

    func testBasics() {
        XCTAssertEqual(camelCase("test case"), "TestCase")
        XCTAssertEqual(camelCase("camel case method"), "CamelCaseMethod")
        XCTAssertEqual(camelCase("say hello "), "SayHello")
        XCTAssertEqual(camelCase(" camel case word"), "CamelCaseWord")
        XCTAssertEqual(camelCase(""), "")
    }
    
}

SolutionTest.defaultTestSuite.run()
