import Foundation

// https://www.codewars.com/kata/541c8630095125aba6000c00/train/swift

func solution2(_ string: String) -> Int {
    var result = 0
    var digits = [Int]()
    
    for char in string {
        let digit = decode(char)
        
        if let last = digits.last, last < digit {
            result += (digit - last - last)
        } else {
            result += digit
        }
        
        digits.append(digit)
    }
    
    return result
}

func decode(_ char: Character) -> Int {
    var digit: Int
    
    switch char {
    case "I":
        digit = 1
    case "V":
        digit = 5
    case "X":
        digit = 10
    case "L":
        digit = 50
    case "C":
        digit = 100
    case "D":
        digit = 500
    case "M":
        digit = 1000
    default:
        digit = 0
    }
    
    return digit
}

func solution(_ string: String) -> Int {
    let sym: [Character: Int] = ["I": 1,
                                 "V": 5,
                                 "X": 10,
                                 "L": 50,
                                 "C": 100,
                                 "D": 500,
                                 "M": 1000]
    var val = 0
    let transform: (Character) -> Int = {
        let res = sym[$0]!
        if res > val { val = res }
        return res < val ? -res : res
    }
    
    return string.reversed().map(transform).reduce(0, +)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("testOneThroughTen", testOneThroughTen),
        ("testBigNumbers", testBigNumbers),
    ]

    func testOneThroughTen() {
        XCTAssertEqual(solution("I"), 1)
        XCTAssertEqual(solution("II"), 2)
        XCTAssertEqual(solution("III"), 3)
        XCTAssertEqual(solution("IV"), 4)
        XCTAssertEqual(solution("V"), 5)
        XCTAssertEqual(solution("VI"), 6)
        XCTAssertEqual(solution("VII"), 7)
        XCTAssertEqual(solution("VIII"), 8)
        XCTAssertEqual(solution("IX"), 9)
        XCTAssertEqual(solution("X"), 10)
    }
    
    func testBigNumbers() {
        XCTAssertEqual(solution("C"), 100)
        XCTAssertEqual(solution("CDXLIV"), 444)
        XCTAssertEqual(solution("M"), 1000)
        XCTAssertEqual(solution("MCMLIV"), 1954)
        XCTAssertEqual(solution("MCMXC"), 1990)
        XCTAssertEqual(solution("MCMXCIX"), 1999)
        XCTAssertEqual(solution("MM"), 2000)
        XCTAssertEqual(solution("MMVIII"), 2008)
        XCTAssertEqual(solution("MMM"), 3000)
        XCTAssertEqual(solution("MMMCM"), 3900)
        XCTAssertEqual(solution("MMMCMXIV"), 3914)
    }
}

SolutionTest.defaultTestSuite.run()
