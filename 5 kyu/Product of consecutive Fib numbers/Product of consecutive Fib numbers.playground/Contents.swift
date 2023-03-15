import Foundation

// https://www.codewars.com/kata/5541f58a944b85ce6d00006a

func productFib(_ prod: UInt64) -> (UInt64, UInt64, Bool) {
    var first: UInt64 = 0
    var second: UInt64 = 1
    
    while first * second < prod {
        let temp = first
        first = second
        second += temp
    }
    return (first, second, first * second == prod)
}

func productFib2(_ prod : UInt64) -> (UInt64,UInt64,Bool) {
    var a: UInt64 = 0, b: UInt64 = 1
    while a * b < prod { (a, b) = (b, a + b) }
    return (a, b, a * b == prod)
}

func productFib3(_ prod : UInt64) -> (UInt64,UInt64,Bool) {
    var f1: UInt64 = 0, f2: UInt64 = 1
    while f1 * f2 < prod {
        let sum = f1 + f2
        f1 = f2
        f2 = sum
    }
    return (f1, f2, prod == f1 * f2)
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    
    func test() {
        doTest(input: 4895,     expected: (  55,    89, true))
        doTest(input: 5895,     expected: (  89,   144, false))
        doTest(input: 74049690, expected: (6765, 10946, true))
    }
    
    private func doTest(input: UInt64, expected: (UInt64, UInt64, Bool)) {
        let actual = productFib(input)
        XCTAssertTrue(actual == expected, "Incorrect answer for prod=\(input)\nActual: \(actual)\nExpected: \(expected)")
    }
    
}

SolutionTest.defaultTestSuite.run()
