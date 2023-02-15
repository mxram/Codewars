import Foundation

// https://www.codewars.com/kata/52761ee4cffbc69732000738/train/swift

func evaluate(good: String, vsEvil evil: String) -> String {
    let goodWorth = worth(of: good, coefficients: [1, 2, 3, 3, 4, 10])
    let evilWorth = worth(of: evil, coefficients: [1, 2, 2, 2, 3, 5, 10])
    if goodWorth > evilWorth {
        return "Battle Result: Good triumphs over Evil"
    } else if goodWorth < evilWorth {
        return "Battle Result: Evil eradicates all trace of Good"
    } else {
        return "Battle Result: No victor on this battle field"
    }
}

func worth(of string: String, coefficients: [Int]) -> Int {
    string.components(separatedBy: " ")
        .compactMap { Int($0) }
        .enumerated()
        .reduce(0) { $0 + $1.element * coefficients[$1.offset] }
}

func worth2(of string: String, coefficients: [Int]) -> Int {
    let counts = string.components(separatedBy: " ").compactMap { Int($0) }
    return zip(counts, coefficients).map(*).reduce(0, +)
}

func worth3(of string: String, coefficients: [Int]) -> Int {
    let counts = string.components(separatedBy: " ").compactMap { Int($0) }
    return zip(counts, coefficients).reduce(0) { $0 + ($1.0 * $1.1) }
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("EvilShouldWin", testEvilShouldWin),
        ("GoodShouldTriumph", testGoodShouldTriumph),
        ("ShouldBeATie", testShouldBeATie)
    ]
    
    func testEvilShouldWin() {
        XCTAssertEqual("Battle Result: Evil eradicates all trace of Good", evaluate(good: "1 1 1 1 1 1",
                                                                                    vsEvil: "1 1 1 1 1 1 1"))
    }
  
    func testGoodShouldTriumph() {
        XCTAssertEqual("Battle Result: Good triumphs over Evil", evaluate(good: "0 0 0 0 0 10",
                                                                          vsEvil: "0 1 1 1 1 0 0"))
    }
  
    func testShouldBeATie() {
        XCTAssertEqual("Battle Result: No victor on this battle field", evaluate(good: "1 0 0 0 0 0",
                                                                                 vsEvil: "1 0 0 0 0 0 0"))
    }
}

SolutionTest.defaultTestSuite.run()
