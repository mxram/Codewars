import Foundation

// https://www.codewars.com/kata/557b5e0bddf29d861400005d/train/swift

// 1 Imperial Gallon = 4.54609188 litres
// 1 Mile = 1.609344 kilometres

func converter(mpg: Int) -> Double {
    Double(mpg) * 1.609344 / 4.54609188
    
}

// MARK: - Tests -
import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Sample Tests", testSample),
    ]

    func testSample() {
        XCTAssertEqual(converter(mpg: 12),  4.25, accuracy: 0.01, "Incorrect answer for mpg: 12)")
        XCTAssertEqual(converter(mpg: 24),  8.50, accuracy: 0.01, "Incorrect answer for mpg: 24)")
        XCTAssertEqual(converter(mpg: 36), 12.74, accuracy: 0.01, "Incorrect answer for mpg: 36)")
    }
}

SolutionTest.defaultTestSuite.run()
