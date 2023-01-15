import Foundation

// https://www.codewars.com/kata/54b42f9314d9229fd6000d9c/train/swift

func duplicateEncode(_ word: String) -> String {
    var letters = [String: Int]()
    for char in word {
        let letter = char.lowercased()
        let count = letters[letter]
        letters[letter] = count != nil ? count! + 1 : 1
    }
    
    return word.map { letters[$0.lowercased()] ?? 0 > 1 ? ")" : "(" }.joined()
}

func duplicateEncode2(_ word: String) -> String {
    var dict = [Character:Int](), word = word.lowercased()
    word.forEach{ dict[$0, default: 0] += 1 }
    return word.map{ dict[$0]! > 1 ? ")":"(" }.joined() // OK
}

func duplicateEncode3(_ word: String) -> String {
    let low = word.lowercased()
    var dict: [Character:String] = [:]
    low.forEach { dict[$0] = dict[$0] == nil ? "(" : ")" }
    return low.reduce("") { $0 + dict[$1]! }
}

func duplicateEncode4(_ word: String) -> String {
    return word.map { ch in word.filter { $0.lowercased() == ch.lowercased() }.count == 1 ? "(" : ")" }.joined()
}


// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(duplicateEncode("din"), "(((")
        XCTAssertEqual(duplicateEncode("recede"), "()()()")
        XCTAssertEqual(duplicateEncode("Success"), ")())())", "should ignore case")
        XCTAssertEqual(duplicateEncode("(( @"), "))((")
    }
}

SolutionTest.defaultTestSuite.run()
