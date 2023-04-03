import Foundation

// https://www.codewars.com/kata/5277c8a221e209d3f6000b56/swift

func wave(_ y: String) -> [String] {
    var result = [String]()
    let array = Array(y)
    array.enumerated().forEach {
        guard $0.1 != " " else { return }
        var chars = array
        chars[$0.0] = Character(chars[$0.0].uppercased())
        result.append(String(chars))
        
    }
    return result
}

func wave2(_ y: String) -> [String] {
    var result: [String] = []
    for i in y.indices where !y[i].isWhitespace {
        result.append(y[..<i] + y[i].uppercased() + y[y.index(after: i)...])
    }
    return result
}

func wave3(_ y: String) -> [String] {
    Array(y).enumerated().compactMap { $1.isWhitespace ? nil : y.prefix($0) + $1.uppercased() + y.dropFirst($0 + 1) }
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    static var allTests = [
        ("hello", testHello),
        ("codewars", testCodewars),
        ("emptyString", testEmptyString),
        ("twoWords", testTwoWords),
        ("gap", testGap),
    ]

    func testHello() {
        let actual = wave("hello")
        XCTAssertEqual(actual, ["Hello", "hEllo", "heLlo", "helLo", "hellO"])
    }
    
    func testCodewars() {
        let actual = wave("codewars")
        XCTAssertEqual(actual, ["Codewars", "cOdewars", "coDewars", "codEwars", "codeWars", "codewArs", "codewaRs", "codewarS"])
    
    }
    
    func testEmptyString() {
        let actual = wave("")
        XCTAssertEqual(actual, [])
    
    }
    
    func testTwoWords() {
        let actual = wave("two words")
        XCTAssertEqual(actual, ["Two words", "tWo words", "twO words", "two Words", "two wOrds", "two woRds", "two worDs", "two wordS"])
    }
    
    
    func testGap() {
        let actual = wave(" gap ")
        XCTAssertEqual(actual, [" Gap ", " gAp ", " gaP "])
    }
    
}

SolutionTest.defaultTestSuite.run()
