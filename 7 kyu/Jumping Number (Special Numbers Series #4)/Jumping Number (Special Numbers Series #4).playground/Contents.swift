import Foundation

// https://www.codewars.com/kata/5a54e796b3bfa8932c0000ed/train/swift

func jumpingNumber(_ number: Int) -> String {
    let digits = String(number).compactMap { $0.wholeNumberValue }
    var previous = digits.first ?? 0
    for digit in digits.dropFirst() {
        if abs(digit - previous) != 1 {
            return "Not!!"
        }
        previous = digit
    }
    
    return "Jumping!!"
}

func jumpingNumber2(_ number: Int) -> String {
    let digits = String(number).compactMap{$0.wholeNumberValue}
    for (d1, d2) in zip(digits[...], digits[1...]) {
        if abs(d1 - d2) != 1 {
            return "Not!!"
        }
    }
    return "Jumping!!"
}

func jumpingNumber3(_ number: Int) -> String {
  let numbers = String(number).compactMap { c in c.wholeNumberValue };
  for i in 1..<numbers.count {
      if abs(numbers[i - 1] - numbers[i]) != 1 {
          return "Not!!";
      }
  }
  return "Jumping!!";
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        for number in [1, 7, 9, 23, 32, 98, 8987, 4343456, 98789876] {
            XCTAssertEqual(jumpingNumber(number), "Jumping!!")
        }
        for number in [79, 100, 33] {
            XCTAssertEqual(jumpingNumber(number), "Not!!")
        }
    }
}

SolutionTest.defaultTestSuite.run()
