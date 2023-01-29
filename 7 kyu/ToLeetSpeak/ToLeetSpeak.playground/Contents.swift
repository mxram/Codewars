import Foundation

// https://www.codewars.com/kata/57c1ab3949324c321600013f/train/swift

let LeetSpeak: [Character : String] = [
    "A" : "@",
    "B" : "8",
    "C" : "(",
    "D" : "D",
    "E" : "3",
    "F" : "F",
    "G" : "6",
    "H" : "#",
    "I" : "!",
    "J" : "J",
    "K" : "K",
    "L" : "1",
    "M" : "M",
    "N" : "N",
    "O" : "0",
    "P" : "P",
    "Q" : "Q",
    "R" : "R",
    "S" : "$",
    "T" : "7",
    "U" : "U",
    "V" : "V",
    "W" : "W",
    "X" : "X",
    "Y" : "Y",
    "Z" : "2"
 ]

func toLeetSpeak2(_ s : String) -> String {
    s.map { LeetSpeak[$0] ?? String($0) }.joined()
}

// Other
let dict : [Character : Character] =
    [   "A" : "@",
        "B" : "8",
        "C" : "(",
        "E" : "3",
        "G" : "6",
        "H" : "#",
        "I" : "!",
        "L" : "1",
        "O" : "0",
        "S" : "$",
        "T" : "7",
        "Z" : "2",
]

func toLeetSpeak(_ s : String) -> String {
  return String(s.map { dict[$0] ?? $0 })
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(toLeetSpeak("LEET"), "1337")
        XCTAssertEqual(toLeetSpeak("CODEWARS"), "(0D3W@R$")
        XCTAssertEqual(toLeetSpeak("HELLO WORLD"), "#3110 W0R1D")
        XCTAssertEqual(toLeetSpeak("LOREM IPSUM DOLOR SIT AMET"), "10R3M !P$UM D010R $!7 @M37")
        XCTAssertEqual(toLeetSpeak("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG"), "7#3 QU!(K 8R0WN F0X JUMP$ 0V3R 7#3 1@2Y D06")
    }
}

SolutionTest.defaultTestSuite.run()
