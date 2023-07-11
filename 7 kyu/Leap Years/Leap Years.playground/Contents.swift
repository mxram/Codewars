import Foundation

// https://www.codewars.com/kata/526c7363236867513f0005ca/train/swift
/*
 - years divisible by 4 are leap years
 - but years divisible by 100 are not leap years
 - but years divisible by 400 are leap years
 */

func isLeapYear(_ year: Int) -> Bool {
    year.isMultiple(of: 4) && !year.isMultiple(of: 100) || year.isMultiple(of: 400)
}



// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Year 2020 is a leap year",   test2020),
        ("Year 2000 is a leap year",   test2000),
        ("Year 2015 is not a leap year",   test2015),
        ("Year 2100 is not a leap year",   test2100),
    ]

    func test2020() {
        XCTAssertEqual(isLeapYear(2020), true)
    }
  
    func test2000() {
        XCTAssertEqual(isLeapYear(2000), true)
    }
  
    func test2015() {
        XCTAssertEqual(isLeapYear(2015), false)
    }
  
    func test2100() {
        XCTAssertEqual(isLeapYear(2100), false)
    }
}

SolutionTest.defaultTestSuite.run()
