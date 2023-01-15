import Foundation

// https://www.codewars.com/kata/57a429e253ba3381850000fb/train/swift

func bmi(_ weight: Int, _ height: Double) -> String {
    let val = Double(weight) / pow(height, 2)
    return val <= 18.5 ? "Underweight" : (val <= 25.0 ? "Normal" : (val <= 30.0 ? "Overweight" : "Obese"))
}

// MARK: - Tests -

import XCTest

class Tests: XCTestCase {
    func tests() {
        XCTAssertEqual("Underweight", bmi(50, 1.80))
        XCTAssertEqual("Normal", bmi(80, 1.80))
        XCTAssertEqual("Overweight", bmi(90, 1.80))
        XCTAssertEqual("Obese", bmi(110, 1.80))
        XCTAssertEqual("Normal", bmi(50, 1.50))
    }
}

Tests.defaultTestSuite.run()
