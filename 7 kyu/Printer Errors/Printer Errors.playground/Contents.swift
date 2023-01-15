import Foundation

// https://www.codewars.com/kata/56541980fa08ab47a0000040/train/swift

func printerError(_ s: String) -> String {
    "\(s.count - s.filter(("a"..."m").contains).count)/\(s.count)"
}

func printerError2(_ s: String) -> String {
    "\(s.filter { $0 > "m" }.count)/\(s.count)"
}

// MARK: - Tests

import XCTest

class SolutionTest: XCTestCase {
    func test() {
        XCTAssertEqual(printerError("aaabbbbhaijjjm"), "0/14")
        XCTAssertEqual(printerError("aaaxbbbbyyhwawiwjjjwwm"), "8/22")
    }
    func test2() {
        XCTAssertEqual(printerError2("aaabbbbhaijjjm"), "0/14")
        XCTAssertEqual(printerError2("aaaxbbbbyyhwawiwjjjwwm"), "8/22")
    }
}

SolutionTest.defaultTestSuite.run()
