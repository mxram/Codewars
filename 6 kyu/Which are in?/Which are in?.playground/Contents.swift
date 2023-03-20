import Foundation

// https://www.codewars.com/kata/550554fd08b86f84fe000a58/train/swift

func inArray(_ a1: [String], _ a2: [String]) -> [String] {
    Set(a1).filter { string in a2.contains { $0.contains(string) } }.sorted()
}

// MARK: Tests

import XCTest

class SolutionTest: XCTestCase {
    static var allTests = [
        ("inArray", testExample),
    ]

    func testing(_ a1: [String], _ a2: [String], _ expected: [String]) {
        XCTAssertTrue(inArray(a1, a2) == expected, "should return \(expected)")
    }
     
    func testExample() {
        var a1 = ["live", "arp", "strong"]
        var a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
        var r = ["arp", "live", "strong"]
        testing(a1, a2, r)
           
        a1 = ["arp", "mice", "bull"]
        a2 = ["lively", "alive", "harp", "sharp", "armstrong"]
        r = ["arp"]
        testing(a1, a2, r)
    }
}

SolutionTest.defaultTestSuite.run()
