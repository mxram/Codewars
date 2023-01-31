import Foundation

// https://www.codewars.com/kata/567501aec64b81e252000003/train/swift

func wallpaper(_ l: Double, _  w: Double,_  h: Double) -> String {
    let numbers = ["zero", "one", "two", "three", "four", "five",
               "six", "seven", "eight", "nine", "ten",
               "eleven", "twelve", "thirteen", "fourteen", "fifteen",
               "sixteen", "seventeen", "eighteen", "nineteen", "twenty"]
    guard l * w * h > 0 else { return numbers[0] }
    return numbers[Int((1.15 * 2 * (l + w) * h / 5.2).rounded(.up))]
}

// MARK: Others



// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(wallpaper(6.3, 4.5, 3.29), "sixteen")
        XCTAssertEqual(wallpaper(0.0, 2.9, 3.29), "zero")
        XCTAssertEqual(wallpaper(6.3, 5.8, 3.13), "seventeen")
        XCTAssertEqual(wallpaper(0.0, 6.7, 2.81), "zero")
    }
}

SolutionTest.defaultTestSuite.run()
