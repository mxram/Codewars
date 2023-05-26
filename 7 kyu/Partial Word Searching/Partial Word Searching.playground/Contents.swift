import Foundation

// https://www.codewars.com/kata/54b81566cd7f51408300022d/train/swift

func wordSearch(_ str: String, _ arr: [String]) -> [String] {
    let result = arr.filter { $0.lowercased().contains(str.lowercased()) }
    return result.isEmpty ? ["Empty"] : result
}

func wordSearch2(_ str:String, _ arr:[String]) -> [String] {
    let result = arr.filter { $0.localizedCaseInsensitiveContains(str) }
    return result.isEmpty ? ["Empty"] : result
}


// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("testWordSearch", testWordSearch),
        ("testWordSearchEdgeCases", testWordSearchEdgeCases),
    ]

    func testWordSearch() {
        XCTAssertEqual(wordSearch("ab", ["za", "ab", "abc", "zab", "zbc"]), ["ab", "abc", "zab"])
        XCTAssertEqual(wordSearch("aB", ["za", "ab", "abc", "zab", "zbc"]), ["ab", "abc", "zab"])
        XCTAssertEqual(wordSearch("ab", ["za", "aB", "Abc", "zAB", "zbc"]), ["aB", "Abc", "zAB"])
        XCTAssertEqual(wordSearch("abcd", ["za", "aB", "Abc", "zAB", "zbc"]), ["Empty"])
        XCTAssertEqual(wordSearch("me", ["home", "milk", "Mercury", "fish"]), ["home", "Mercury"])
    }
    
    func testWordSearchEdgeCases() {
        XCTAssertEqual(wordSearch("ab", []), ["Empty"])
        XCTAssertEqual(wordSearch("", []), ["Empty"])
        XCTAssertEqual(wordSearch("", ["ab"]), ["Empty"])
        XCTAssertEqual(wordSearch("", [""]), ["Empty"])
        XCTAssertEqual(wordSearch("Empty", ["Empty"]), ["Empty"])
    }
}

SolutionTest.defaultTestSuite.run()
