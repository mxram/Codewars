import Foundation

// https://www.codewars.com/kata/55cbd4ba903825f7970000f5/train/swift

func getGrade(_ s1: Int, _ s2: Int, _ s3: Int) -> String {
    switch ((s1 + s2 + s3) / 3) {
    case 90...100:
        return "A"
    case 80..<90:
        return "B"
    case 70..<80:
        return "C"
    case 60..<70:
        return "D"
    default:
        return "F"
    }
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("Test Example", testExample),
    ]
    
    func testExample() {
        XCTAssertEqual(getGrade(95,90,93), "A", "Expected A, but got \(getGrade(95,90,93))")
        XCTAssertEqual(getGrade(100,85,96), "A", "Expected A, but got \(getGrade(100,85,96))")
        XCTAssertEqual(getGrade(92,93,94), "A", "Expected A, but got \(getGrade(92,93,94))")
        XCTAssertEqual(getGrade(100,100,100), "A", "Expected A, but got \(getGrade(100,100,100))")
    }
}

SolutionTest.defaultTestSuite.run()
