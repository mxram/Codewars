import Foundation

// https://www.codewars.com/kata/5a4e3782880385ba68000018/train/swift

func balancedNumber(_ number: Int) -> String {
    let digits = String(number).compactMap { $0.wholeNumberValue }
    let middleIndex = digits.count / 2 - ((digits.count % 2 == 0) ? 1 : 0)
    let leftSum = digits.prefix(middleIndex).reduce(0, +)
    let rightSum = digits.suffix(middleIndex).reduce(0, +)
    
    return leftSum == rightSum ? "Balanced" : "Not Balanced"
}

func balancedNumber2(_ number: Int) -> String {
    let digits = String(number).compactMap{$0.wholeNumberValue }
    let part1 = digits.dropLast(digits.count / 2 + 1).reduce(0, +)
    let part2 = digits.dropFirst(digits.count / 2 + 1).reduce(0 ,+)
    return part1 == part2 ? "Balanced" : "Not Balanced"
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func tests() {
        XCTAssertEqual(balancedNumber(7), "Balanced")
        XCTAssertEqual(balancedNumber(959), "Balanced")
        XCTAssertEqual(balancedNumber(13), "Balanced")
        XCTAssertEqual(balancedNumber(56239814), "Balanced")
        XCTAssertEqual(balancedNumber(424), "Balanced")
        XCTAssertEqual(balancedNumber(1024), "Not Balanced")
        XCTAssertEqual(balancedNumber(66545), "Not Balanced")
        XCTAssertEqual(balancedNumber(295591), "Not Balanced")
        XCTAssertEqual(balancedNumber(1230987), "Not Balanced")
        XCTAssertEqual(balancedNumber(432), "Not Balanced")
    }
}

SolutionTest.defaultTestSuite.run()
