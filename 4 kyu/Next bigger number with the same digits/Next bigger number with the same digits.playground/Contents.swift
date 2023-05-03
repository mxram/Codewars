import Foundation

// https://www.codewars.com/kata/55983863da40caa2c900004e/train/swift

func nextBigger(num: Int) -> Int? {
    var digits = String(num).reversed().compactMap { $0.wholeNumberValue }
    print(digits)
    sortDigits(to: digits.count - 1)
    
    func sortDigits(to index: Int, reversed: Bool = false) {
        var prev = digits[0]
        for i in 1...index {
            let current = digits[i]
            if reversed ? current > prev : current < prev {
                digits[i - 1] = current
                digits[i] = prev
                if i > 1 {
                    print("nexSort")
                    sortDigits(to: i - 1, reversed: true)
                }
                break
            }
            prev = current
        }
    }
    
    return Int(digits.reversed().map { String($0) }.joined()) ?? num
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    func test() {
        XCTAssertEqual(nextBigger(num: 12), 21)
        XCTAssertEqual(nextBigger(num: 513), 531)
        XCTAssertEqual(nextBigger(num: 2017), 2071)
        XCTAssertEqual(nextBigger(num: 414), 441)
        XCTAssertEqual(nextBigger(num: 144), 414)
        XCTAssertEqual(nextBigger(num: 80352), 80523)
    }
    
}

SolutionTest.defaultTestSuite.run()
