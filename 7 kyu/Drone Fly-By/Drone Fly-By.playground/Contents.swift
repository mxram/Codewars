import Foundation

// https://www.codewars.com/kata/58356a94f8358058f30004b5/train/swift

func flyBy(lamps: String, drone: String) -> String {
    lamps.replacingCharacters(in: drone.startIndex..<drone.endIndex,
                              with: String(repeating: "o", count: drone.count))
}

func flyBy2(lamps: String, drone: String) -> String {
    String(repeating: "o", count: drone.count) + String(repeating: "x", count: (lamps.count - drone.count))
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(flyBy(lamps: "xxxxxx", drone: "====T"), "ooooox")
        XCTAssertEqual(flyBy(lamps: "xxxxxxxxx", drone: "==T"), "oooxxxxxx")
        XCTAssertEqual(flyBy(lamps: "xxxxxxxxxxxxxxx", drone: "=========T"), "ooooooooooxxxxx")
    }
}

SolutionTest.defaultTestSuite.run()
