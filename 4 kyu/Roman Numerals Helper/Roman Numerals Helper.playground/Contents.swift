import Foundation

// https://www.codewars.com/kata/51b66044bce5799a7f000003/train/swift

class RomanNumerals {

    static func toRoman(_ number: Int) -> String {
        var n = number, result = ""
        let dict = [(1000, "M"),
                    (900, "CM"),
                    (500, "D"),
                    (400, "CD"),
                    (100, "C"),
                    (90, "XC"),
                    (50, "L"),
                    (40, "XL"),
                    (10, "X"),
                    (9, "IX"),
                    (5, "V"),
                    (4, "IV"),
                    (1, "I")]
        dict.forEach {
            while n >= $0 {
                result += $1
                n -= $0
            }
        }
        return result
    }

    static func fromRoman(_ roman: String) -> Int {
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
        
        return roman.reversed().map(transform).reduce(0, +)
    }

}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("1000 should equal M", testRoman1000),
        ("999 should equal CMXCIX", testRoman999),
        ("4 should equal IV", testRoman4),
        ("1 should equal I", testRoman1),
        ("1991 should equal MCMXCI", testRoman1991),
        ("2006 should equal MMVI", testRoman2006),
        ("2020 should equal MMXX", testRoman2020),
        
        ("XXI should equal 21", testInteger21),
        ("I should equal 1", testInteger1),
        ("III should equal 3", testInteger3),
        ("IV should equal 4", testInteger4),
        ("MMVII should equal 2007", testInteger2007),
        ("MDCLXIX should equal 1669", testInteger1669),
    ]

    func testRoman1000() {
        XCTAssertEqual(RomanNumerals.toRoman(1000), "M")
    }
    
    func testRoman999() {
        XCTAssertEqual(RomanNumerals.toRoman(999), "CMXCIX")
    }
    
    func testRoman4() {
        XCTAssertEqual(RomanNumerals.toRoman(4), "IV")
    }
    
    func testRoman1() {
        XCTAssertEqual(RomanNumerals.toRoman(1), "I")
    }
    
    func testRoman1991() {
        XCTAssertEqual(RomanNumerals.toRoman(1991), "MCMXCI")
    }
    
    func testRoman2006() {
        XCTAssertEqual(RomanNumerals.toRoman(2006), "MMVI")
    }
    
    func testRoman2020() {
        XCTAssertEqual(RomanNumerals.toRoman(2020), "MMXX")
    }
    
    
    func testInteger21() {
        XCTAssertEqual(RomanNumerals.fromRoman("XXI"), 21)
    }
    
    func testInteger1() {
        XCTAssertEqual(RomanNumerals.fromRoman("I"), 1)
    }
    
    func testInteger3() {
        XCTAssertEqual(RomanNumerals.fromRoman("III"), 3)
    }
    
    func testInteger4() {
        XCTAssertEqual(RomanNumerals.fromRoman("IV"), 4)
    }
    
    func testInteger2007() {
        XCTAssertEqual(RomanNumerals.fromRoman("MMVII"), 2007)
    }
    
    func testInteger1669() {
        XCTAssertEqual(RomanNumerals.fromRoman("MDCLXIX"), 1669)
    }
}

SolutionTest.defaultTestSuite.run()
