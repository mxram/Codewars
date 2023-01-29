import Foundation

// https://www.codewars.com/kata/586538146b56991861000293/train/swift

let NATO: [Character : String] = [
    "a" : "Alfa",
    "b" : "Bravo",
    "c" : "Charlie",
    "d" : "Delta",
    "e" : "Echo",
    "f" : "Foxtrot",
    "g" : "Golf",
    "h" : "Hotel",
    "i" : "India",
    "j" : "Juliett",
    "k" : "Kilo",
    "l" : "Lima",
    "m" : "Mike",
    "n" : "November",
    "o" : "Oscar",
    "p" : "Papa",
    "q" : "Quebec",
    "r" : "Romeo",
    "s" : "Sierra",
    "t" : "Tango",
    "u" : "Uniform",
    "v" : "Victor",
    "w" : "Whiskey",
    "x" : "Xray",
    "y" : "Yankee",
    "z" : "Zulu"
 ]

func toNato(_ words: String) -> String {
    words.compactMap {
        guard $0 != " ",
              let char = $0.lowercased().first else {
            return nil
        }
        return NATO[char] ?? String($0)
    }.joined(separator: " ")
}

func toNato2(_ words: String) -> String {
    return words.lowercased().compactMap { NATO[$0] }.joined(separator: " ")
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(toNato("If you can read"), "India Foxtrot Yankee Oscar Uniform Charlie Alfa November Romeo Echo Alfa Delta")
        XCTAssertEqual(toNato("Did not see that coming"), "Delta India Delta November Oscar Tango Sierra Echo Echo Tango Hotel Alfa Tango Charlie Oscar Mike India November Golf")
        XCTAssertEqual(toNato("go for it!"), "Golf Oscar Foxtrot Oscar Romeo India Tango !")
    }
}

SolutionTest.defaultTestSuite.run()
