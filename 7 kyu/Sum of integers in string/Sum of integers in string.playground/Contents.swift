import Foundation

// https://www.codewars.com/kata/598f76a44f613e0e0b000026/train/swift

func sumOfIntegersInString(_ string: String) -> Int {
    string.split { !$0.isNumber }.compactMap { Int($0) }.reduce(0, +)
}

func sumOfIntegersInString2(_ string: String) -> Int {
    string
        .components(separatedBy: CharacterSet.decimalDigits.inverted)
        .compactMap { Int($0) }
        .reduce(0, +)
}

func sumOfIntegersInString3(_ string: String) -> Int {
    string.map { String($0.wholeNumberValue ?? -1) }
        .joined()
        .components(separatedBy: "-1")
        .compactMap { Int($0) }
        .reduce(0, +)
}

// MARK: - Tests

import XCTest

//      Executed 3 tests, with 0 failures (0 unexpected) in 0.225 (0.226) seconds
class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(sumOfIntegersInString("12.4"), 16)
        XCTAssertEqual(sumOfIntegersInString("h3ll0w0rld"), 3)
        XCTAssertEqual(sumOfIntegersInString("2 + 3 = "), 5)
        XCTAssertEqual(sumOfIntegersInString("Our company made approximately 1 million in gross revenue last quarter."), 1)
        XCTAssertEqual(sumOfIntegersInString("The Great Depression lasted from 1929 to 1939."), 3868)
        XCTAssertEqual(sumOfIntegersInString("Dogs are our best friends."), 0)
        XCTAssertEqual(sumOfIntegersInString("C4t5 are 4m4z1ng."), 18)
        XCTAssertEqual(sumOfIntegersInString("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy dog"), 3635)
    }
}

SolutionTest.defaultTestSuite.run()

