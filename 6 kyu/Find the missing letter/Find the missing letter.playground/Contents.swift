import Foundation

// https://www.codewars.com/kata/585d7d5adb20cf33cb000235/train/swift

func findMissingLetter(_ chArr: [Character]) -> Character {
    for ch in chArr {
        let next = Character(UnicodeScalar((ch.asciiValue ?? 0) + 1))
        if !chArr.contains(next) { return next }
    }
    fatalError("Incorrect input data")
}

func findMissingLetter2(_ chArr: [Character]) -> Character {
    let first = chArr[0]
    var alphabet = "abcdefghijklmnopqrstuvwxyz"
    if first.isUppercase {
        alphabet = alphabet.uppercased()
    }
    let suffix = alphabet.trimmingPrefix(while: { $0 != first })
    return zip(suffix, chArr).first { $0 != $1 }?.0 ?? first
}

// MARK: - Tests -

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(findMissingLetter(["a","b","c","d","f"]), "e")
        XCTAssertEqual(findMissingLetter(["O","Q","R","S"]), "P")
    }
}

SolutionTest.defaultTestSuite.run()
