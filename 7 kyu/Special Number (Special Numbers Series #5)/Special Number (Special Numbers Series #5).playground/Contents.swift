import Foundation

// https://www.codewars.com/kata/5a55f04be6be383a50000187/train/swift

func specialNumber(_ number: Int) -> String {
    String(number).compactMap { $0.wholeNumberValue }.contains { $0 > 5 } ? "NOT!!" : "Special!!"
}

func specialNumber2(_ number: Int) -> String {
    String(number).filter { $0.wholeNumberValue! > 5 }.count == 0 ? "Special!!" : "NOT!!";
}

func specialNumber3(_ number: Int) -> String {
    String(number) == String(number).filter { "012345".contains($0) } ? "Special!!" : "NOT!!"
}

func specialNumber4(_ number: Int) -> String {
    Array(String(number)).contains { "6789".contains($0) } ? "NOT!!" : "Special!!"
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        for number in [2, 3, 11, 55, 25432] {
            XCTAssertEqual(specialNumber(number), "Special!!");
        }
        for number in [2789, 6, 9, 26, 92] {
            XCTAssertEqual(specialNumber(number), "NOT!!");
        }
    }
}

SolutionTest.defaultTestSuite.run()
