import Foundation

// https://www.codewars.com/kata/5264d2b162488dc400000001/train/swift

func spinWords(in sentence: String) -> String {
    sentence.components(separatedBy: " ").map { $0.count > 4 ? String($0.reversed()) : $0 }.joined(separator: " ")
}

// MARK: Others

func spinWords2(in sentence: String) -> String {
    sentence
        .split(separator: " ")
        .map { "\($0)" }
        .map { $0.count > 4 ? String($0.reversed()) : $0 }
        .joined(separator: " ")
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test0() {
        let testCases = [
            ("Welcome", "emocleW"),
            ("to", "to"),
            ("CodeWars", "sraWedoC"),
        ]
        assertTest(testCases)
    }
    
    func test1() {
        let testCases = [
            ("Hey fellow warriors", "Hey wollef sroirraw"),
            ("This sentence is a sentence", "This ecnetnes is a ecnetnes"),
        ]
        assertTest(testCases)
    }
    
    private func assertTest(_ testCase: [(String, String)]) {
        testCase.forEach {
            XCTAssertEqual(spinWords(in: $0.0), $0.1)
        }
    }
}

SolutionTest.defaultTestSuite.run()
