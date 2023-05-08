import Foundation

// https://www.codewars.com/kata/5d50e3914861a500121e1958/train/swift

func addLetters(_ letters: [Character]) -> Character {
    let alphabet = Array("zabcdefghijklmnopqrstuvwxy")
    return alphabet[letters.compactMap { alphabet.firstIndex(of: $0) }.reduce(0, +) % alphabet.count]
}

func addLetters2(_ letters: [Character]) -> Character {
    let sum = (letters.map { Int($0.asciiValue! - 96) }.reduce(0, +) + 25) % 26 + 97
    return Character(UnicodeScalar(sum)!)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(addLetters(["a", "b", "c"]), "f")
        XCTAssertEqual(addLetters(["z"]), "z")
        XCTAssertEqual(addLetters(["a", "b"]), "c")
        XCTAssertEqual(addLetters(["c"]), "c")
        XCTAssertEqual(addLetters(["z", "a"]), "a")
        XCTAssertEqual(addLetters(["y", "c", "b"]), "d")
        XCTAssertEqual(addLetters([]), "z")
    }
}

SolutionTest.defaultTestSuite.run()
