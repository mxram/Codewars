import Foundation

// https://www.codewars.com/kata/5168bb5dfe9a00b126000018/train/swift

func reverse1(_ str: String) -> String {
    String(str.reversed())
}

// MARK: - Solution 2: -

func reverse(_ str: String) -> String {
    var reverse = ""
    for s in str {
        reverse = String(s) + reverse
    }
    
    return reverse
}

func reverse2(_ str: String) -> String {
    str.reduce("") { "\($1)" + $0 }
}


// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Short words", testShortWords),
        ("Longer words", testLongerWords)
    ]

    func testShortWords() {
        XCTAssertEqual(reverse("hello"), "olleh")
        XCTAssertEqual(reverse("rat"), "tar")
        XCTAssertEqual(reverse("alpha"), "ahpla")
    }
    
    func testLongerWords() {
        XCTAssertEqual(reverse("codewars"), "srawedoc")
        XCTAssertEqual(reverse("football"), "llabtoof")
        XCTAssertEqual(reverse("translation"), "noitalsnart")
    }
}

SolutionTest.defaultTestSuite.run()
