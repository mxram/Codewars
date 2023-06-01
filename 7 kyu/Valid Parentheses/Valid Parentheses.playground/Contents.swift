import Foundation

// https://www.codewars.com/kata/6411b91a5e71b915d237332d/train/swift

func validParentheses(_ str: String) -> Bool {
    var counter = 0
    for char in str {
        counter += char == "(" ? 1 : -1
        if counter < 0 {
            return false
        }
    }
    return counter == 0
}

func validParentheses2(_ str: String) -> Bool {
    str.isEmpty || (try? NSRegularExpression(pattern: str)) != nil
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
      ("Should return true for valid parentheses",    testValid  ),
      ("Should return False for invalid parentheses", testInvalid),
      ("Should return True for empty strings",        testEmpty  ),
    ]

    func testValid() {
      doTest(true, "()")
      doTest(true, "((()))")
      doTest(true, "()()()")
      doTest(true, "(()())()")
      doTest(true, "()(())((()))(())()")
    }
    
    func testInvalid() {
      doTest(false, ")(")
      doTest(false, "()()(")
      doTest(false, "((())")
      doTest(false, "())(()")
      doTest(false, ")()")
      doTest(false, ")")
    }
    
    func testEmpty() {
      doTest(true, "")
    }
    
    private func doTest(_ expected: Bool, _ input: String) {
      let actual = validParentheses(input);
      XCTAssertEqual(actual, expected, "\nIncorrect answer for str = \"\(input)\"")
    }
}

SolutionTest.defaultTestSuite.run()
